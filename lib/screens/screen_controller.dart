import 'package:coffee_shop/business_logic/cart_provider.dart';
import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:coffee_shop/screens/favourite_screen.dart';
import 'package:coffee_shop/screens/home.dart';
import 'package:coffee_shop/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../business_logic/bottom_navigation_provider.dart';
import '../models/color_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color colors = Colors.white;
  @override
  Widget build(BuildContext context) {
    final bottomNavigationIndexController = [
      const HomeScreen(),
      const FavourtieScreen(),
      const CartPage(),
      const NotificationScreen()
    ];
    return Consumer<BottomNavProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: AnimatedSwitcher(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
            child: bottomNavigationIndexController[value.index]),
        bottomNavigationBar: SizedBox(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.shifting,
                currentIndex: value.index,
                onTap: (index) {
                  value.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: colors,
                      activeIcon: SizedBox(
                          height: 23.h,
                          width: 23.w,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                  child: Image.asset('assets/images/home.png')),
                              Positioned(
                                top: 28.h,
                                left: 2.w,
                                child: Container(
                                  height: 5.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            ColorType.buttonColor,
                                            ColorType.buttonColorLight,
                                          ])),
                                ),
                              )
                            ],
                          )),
                      label: '',
                      icon: SizedBox(
                          height: 23.h,
                          width: 23.w,
                          child: Image.asset('assets/images/home_gray.png'))),
                  BottomNavigationBarItem(
                    backgroundColor: colors,
                    label: '',
                    activeIcon: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                                child:
                                    Image.asset('assets/images/favourite.png')),
                            Positioned(
                              top: 24.h,
                              left: 2.w,
                              child: Container(
                                height: 5.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          ColorType.buttonColor,
                                          ColorType.buttonColorLight,
                                        ])),
                              ),
                            )
                          ],
                        )),
                    icon: SizedBox(
                        height: 23.h,
                        width: 23.w,
                        child: Image.asset('assets/images/favourite_gray.png')),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: colors,
                    label: '',
                    activeIcon: Consumer<CartProvider>(
                      builder: (context, value, child) => Stack(
                        children: [
                          Positioned(
                              child: SizedBox(
                                  height: 25.h,
                                  width: 25.w,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        child: Image.asset(
                                            'assets/images/cart.png'),
                                      ),
                                      Positioned(
                                        top: 25.h,
                                        left: 2.w,
                                        child: Container(
                                          height: 5.h,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    ColorType.buttonColor,
                                                    ColorType.buttonColorLight,
                                                  ])),
                                        ),
                                      )
                                    ],
                                  ))),
                          value.cart.isNotEmpty
                              ? Positioned(
                                  left: 10.w,
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ))
                              : const Text(''),
                        ],
                      ),
                    ),
                    icon: Consumer<CartProvider>(
                      builder: (context, value, child) => Stack(
                        children: [
                          Positioned(
                              child: SizedBox(
                                  height: 23.h,
                                  width: 23.w,
                                  child: Image.asset(
                                      'assets/images/cart_gray.png'))),
                          value.cart.isNotEmpty
                              ? Positioned(
                                  left: 10.w,
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ))
                              : const Text(''),
                        ],
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                      backgroundColor: colors,
                      label: 'Profile',
                      activeIcon: SizedBox(
                          height: 23.h,
                          width: 23.w,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                  child: Image.asset(
                                      'assets/images/notification.png')),
                              Positioned(
                                top: 24.h,
                                left: 2.w,
                                child: Container(
                                  height: 5.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            ColorType.buttonColor,
                                            ColorType.buttonColorLight,
                                          ])),
                                ),
                              )
                            ],
                          )),
                      icon: SizedBox(
                          height: 23.h,
                          width: 23.w,
                          child: Image.asset(
                              'assets/images/notification_gray.png')))
                ]),
          ),
        ),
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget child;

  PageTransition({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
