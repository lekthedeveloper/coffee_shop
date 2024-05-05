import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coffee_shop/business_logic/bottom_navigation_provider.dart';
import 'package:coffee_shop/business_logic/cart_provider.dart';
import 'package:coffee_shop/business_logic/category_provider.dart';
import 'package:coffee_shop/business_logic/favourite_provider.dart';
import 'package:coffee_shop/business_logic/notification_provider.dart';
import 'package:coffee_shop/business_logic/video_provider.dart';
import 'package:coffee_shop/screens/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

import 'routes_controller.dart';

void main() async {
  Stripe.publishableKey =
      'pk_test_51OfYBCBV3nfE79FccEQRAJflYwd2m3zJ8eB7O9xLpu7skLdL5oqvCAqcLFQwGFlHRov1789AgOkBtebQs8COismR001aYlzHzI';
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: 'order_channel_group',
        channelKey: 'order_channel',
        channelName: 'Order Notifications',
        channelDescription: 'Order notifications channels')
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'order_channel_group', channelGroupName: 'order Group')
  ]);
  bool isNotificationAllowed =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isNotificationAllowed) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CoffeeCategoryProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => VideoProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider())
      ],
      builder: (context, child) => const ScreenUtilInit(
        designSize: Size(360, 690),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Dashboard(),
          initialRoute: RouteManager.homepage,
          onGenerateRoute: RouteManager.generateRoute,
        ),
      ),
    );
  }
}
