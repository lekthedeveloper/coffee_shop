import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../business_logic/cart_provider.dart';

class AddtoCartAnimation extends StatelessWidget {
  final String animationType;
  const AddtoCartAnimation({super.key, required this.animationType});

  @override
  Widget build(BuildContext context) {
    return animationType == 'addtocart'
        ? Consumer<CartProvider>(
            builder: (context, v, child) => Visibility(
              visible: v.addToCartNotfication,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.0),
                duration: const Duration(seconds: 5),
                builder: (context, value, child) => FadeTransition(
                  opacity: AlwaysStoppedAnimation(value),
                  child: Container(
                    height: 30.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(176, 90, 63, 9),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/warning.png')),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Added to Cart',
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontFamily: 'sora',
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                  ),
                ),
              ),
            ),
          )
        : Consumer<CartProvider>(
            builder: (context, v, child) => Visibility(
              visible: v.itemNotinCartNotification,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.0),
                duration: const Duration(seconds: 5),
                builder: (context, value, child) => FadeTransition(
                  opacity: AlwaysStoppedAnimation(value),
                  child: Container(
                    height: 30.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(176, 90, 63, 9),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/warning.png')),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Flavour already in cart',
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontFamily: 'sora',
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                  ),
                ),
              ),
            ),
          );
  }
}
