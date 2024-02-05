import 'package:coffee_shop/business_logic/cart_provider.dart';
import 'package:coffee_shop/models/color_model.dart';
import 'package:coffee_shop/routes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 125.w),
                child: const Icon(Icons.arrow_back_ios),
              ),
              Padding(
                padding: EdgeInsets.only(right: 100.w),
                child: Text(
                  'My Cart',
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
          Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              left: 10.w,
              bottom: 20.h,
            ),
            child: Text(
              'My Cart',
              style: TextStyle(
                  fontFamily: 'sora',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, value, child) => Visibility(
                visible: value.cart.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: LottieBuilder.asset('assets/lottie_files/search.json'),
                )),
          ),
          Consumer<CartProvider>(
            builder: (context, value, child) => Visibility(
              visible: value.cart.isNotEmpty,
              child: SizedBox(
                height: 417.h,
                width: 360.w,
                child: Consumer<CartProvider>(
                  builder: (context, value, child) => ListView.separated(
                    padding: const EdgeInsets.all(0),
                    itemCount: value.cart.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 10.w),
                      child: Container(
                        height: 80.h,
                        width: 330.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorType.buttonColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: CircleAvatar(
                                maxRadius: 20.sp,
                                backgroundImage:
                                    AssetImage(value.cart[index].imageLink!),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w, top: 23.h, right: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.cart[index].title!,
                                    style: TextStyle(
                                        fontFamily: 'sora',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    value.cart[index].extra!,
                                    style: TextStyle(
                                        fontFamily: 'sora',
                                        color: ColorType.extraTextColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      value.increaseQuantityWhere(
                                          value.cart[index].extra!, 'decrease');
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: ColorType.buttonColor,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                                Text(
                                  value.cart[index].quatity.toString(),
                                  style: TextStyle(
                                      fontFamily: 'sora',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.w, right: 40.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      value.increaseQuantityWhere(
                                          value.cart[index].extra!, 'increase');
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: ColorType.buttonColor,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.h, bottom: 5.h),
                                  child: GestureDetector(
                                    onTap: () => value.removeFromCart(index),
                                    child: SizedBox(
                                      height: 20.h,
                                      width: 20.w,
                                      child: Image.asset(
                                          'assets/images/remove.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${value.cart[index].price!.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontFamily: 'sora',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, value, child) => value.cart.isEmpty
            ? SizedBox(
                height: 0.h,
                width: 0.w,
              )
            : SizedBox(
                height: 60.h,
                width: 300.w,
                child: Row(children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '\$${value.currentCartEstimate}',
                      style: TextStyle(
                          color: ColorType.buttonColor,
                          fontFamily: 'sora',
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.orderScreen);
                      },
                      child: Container(
                        height: 40.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            color: ColorType.buttonColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                                fontFamily: 'sora',
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ]),
              ),
      ),
    );
  }
}
