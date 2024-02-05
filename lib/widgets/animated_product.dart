import 'package:coffee_shop/models/color_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../business_logic/cart_provider.dart';

class AnimatedProductITem extends StatefulWidget {
  final dynamic listType;
  final bool isTapped;
  final VoidCallback tap;
  final VoidCallback toastTap;

  const AnimatedProductITem(
      {super.key,
      required this.isTapped,
      required this.listType,
      required this.tap,
      required this.toastTap});

  @override
  State<AnimatedProductITem> createState() => _AnimatedProductITemState();
}

class _AnimatedProductITemState extends State<AnimatedProductITem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: Container(
              height: 120.h,
              width: 150.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.listType.image!)),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          size: 15.sp,
                          Icons.star,
                          color: ColorType.iconColor,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          widget.listType.rating.toString(),
                          style: TextStyle(
                              fontFamily: 'sora',
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.h, left: 10.w),
            child: Text(
              widget.listType.title!,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'sora',
                  fontSize: 15.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 4.h),
            child: Text(
              widget.listType.extraIngredient!,
              style: TextStyle(
                  fontFamily: 'sora',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff9B9B9B)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '\$ ${widget.listType.price!.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'sora',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 7.w, bottom: 3.h),
                  child: GestureDetector(
                    onTap: () {
                      widget.tap();
                      widget.toastTap();
                      if (context
                          .read<CartProvider>()
                          .itemName
                          .contains(widget.listType.extraIngredient!)) {
                        debugPrint('yes item is in cart');
                        // context.read<Cart>().itemNotinCartAnimation();
                      } else {
                        // context.read<Cart>().startCartAnimation();
                        context.read<CartProvider>().newCartItem(
                            title: widget.listType.title,
                            extra: widget.listType.extraIngredient,
                            price: widget.listType.price,
                            size: 's',
                            quatity: 1,
                            imageLink: widget.listType.image);
                      }
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: widget.isTapped
                          ? Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: SizedBox(
                                height: 34.9.h,
                                width: 34.w,
                                child: LottieBuilder.asset(
                                    'assets/lottie_files/coffee_2.json'),
                              ),
                            )
                          : Container(
                              height: 33.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: ColorType.buttonColor),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
