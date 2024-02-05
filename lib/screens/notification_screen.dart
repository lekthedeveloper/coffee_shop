import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../business_logic/notification_provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 10.w, right: 90.w),
                child: SizedBox(
                  height: 25.h,
                  width: 25.w,
                  child: Image.asset('assets/images/icon.png'),
                )),
            Padding(
              padding: EdgeInsets.only(right: 80.w),
              child: Text(
                'Notifications',
                style: TextStyle(
                    fontFamily: 'sora',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 25.h,
              width: 25.w,
              child: Image.asset('assets/images/icon.png'),
            )
          ],
        ),
        Consumer<NotificationProvider>(
          builder: (context, value, child) => Visibility(
            visible: value.notifications.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.only(left: 0.w, top: 5.h),
              child: Center(
                child: GestureDetector(
                  onTap: () => value.clearNotifications(),
                  child: Text(
                    'Clear Notifications',
                    style: TextStyle(fontFamily: 'sora', fontSize: 10.sp),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        context.read<NotificationProvider>().notifications.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: SizedBox(
                  child: LottieBuilder.asset(
                      fit: BoxFit.cover,
                      'assets/lottie_files/notification.json'),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: SizedBox(
                    height: 450.h,
                    width: 320.w,
                    child: Consumer<NotificationProvider>(
                      builder: (context, value, child) => ListView.separated(
                        padding: const EdgeInsets.all(0),
                        itemCount: value.notifications.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value.notifications[index].date,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10.sp,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                          height: 40.h,
                                          width: 40.w,
                                          child: Image.asset(
                                              'assets/images/notify.png')),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.notifications[index]
                                                .notificationTitle,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 10.sp),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            value.notifications[index]
                                                .notificationMsg,
                                            style: TextStyle(fontSize: 10.sp),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            '${value.notifications[index].date}.${value.notifications[index].timeOfDay}',
                                            style: TextStyle(fontSize: 8.sp),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                      ),
                    )),
              )
      ]),
    );
  }
}
