import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coffee_shop/business_logic/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/notification_model.dart';
import '../routes_controller.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeNotifications();
    });
  }

  void _initializeNotifications() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'order_channel',
        title: 'Order Placed',
        body: 'Your order has been placed successfully!',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0.w,
            top: 0.h,
            right: 0.w,
            child: Container(
              height: 450.h,
              width: 370.w,
              decoration: const BoxDecoration(
                color: Color.fromARGB(220, 215, 213, 213),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 110.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(RouteManager.homepage);
                              context.read<CartProvider>().clearCart();
                            },
                            child: SizedBox(
                                height: 25.h,
                                width: 25.w,
                                child: const Icon(Icons.arrow_back_ios)),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0.w,
            top: 400.h,
            right: 0.w,
            child: Container(
              height: 290.h,
              width: 370.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  child: Container(
                    height: 5.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffEAEAEA),
                    ),
                  ),
                ),
                Text(
                  '10 minutes left',
                  style: TextStyle(
                      fontFamily: 'sora',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100.w, top: 5.h),
                  child: Row(
                    children: [
                      Text(
                        'Delivery to',
                        style: TextStyle(
                            fontFamily: 'sora',
                            fontSize: 11.sp,
                            color: const Color(0xff808080),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Jl. Kpg Sutoyo',
                        style: TextStyle(
                            fontFamily: 'sora',
                            fontSize: 11.sp,
                            color: const Color(0xff303336),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, top: 15.h, bottom: 15.h),
                  child: Row(
                    children: [
                      Container(
                        height: 4.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff36C07E),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 4.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff36C07E),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 4.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff36C07E),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 4.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffDFDFDF),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffEAEAEA))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                          height: 60.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xffEAEAEA),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Image.asset('assets/images/rider.png'),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 18.h, left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivered your order',
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              'We deliver your goods to you in \n the shortes possible time.',
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontSize: 11.sp,
                                  color: const Color(0xff808080),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 20.w),
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/driver.png')),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 90.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Johan Hawn',
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Personal Courier',
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontSize: 11.sp,
                                  color: const Color(0xff808080),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 50.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xffEAEAEA),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/images/telephone.png'),
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
