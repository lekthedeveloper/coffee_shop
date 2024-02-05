import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../business_logic/notification_provider.dart';
import '../routes_controller.dart';

class StripeCheckout {
  bool mounted;
  BuildContext context;
  StripeCheckout({required this.mounted, required this.context});
  Map<String, dynamic>? paymentIntent;

  makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();

      if (paymentIntent != null && paymentIntent!['client_secret'] != null) {
        var gpay = const PaymentSheetGooglePay(
            merchantCountryCode: 'US', currencyCode: 'USD', testEnv: true);
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentIntent!['client_secret'],
                style: ThemeMode.light,
                merchantDisplayName: 'Coffee Shop',
                googlePay: gpay));
        if (mounted) displayPaymentSheet(context);

        if (mounted) {
          context.read<NotificationProvider>().orderSuccessNotification();
        }
      } else {
        debugPrint(
            'Invalid payment intent response please check stripe server');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      if (mounted) {
        Navigator.of(context).pushNamed(RouteManager.deliveryScreen);
        //context.read<CartProvider>().clearCart();
      }
    } catch (e) {
      debugPrint('failed');
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {'amount': '152', 'currency': 'USD'};

      http.Response response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51OfYBCBV3nfE79Fc3DI0gbNOMUuWnWE96Mwm3JBNOOVnSe1n2XyjGjbGAvyNNJUQjynfnfBWhEsY5LgSptt5Mugk00skMY2rDU',
            'Content-Type': 'application/x-www-form-urlencoded'
          });

      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
