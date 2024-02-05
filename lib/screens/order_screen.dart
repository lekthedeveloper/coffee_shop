import 'package:coffee_shop/business_logic/cart_provider.dart';
import 'package:coffee_shop/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../models/color_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 45.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_ios)),
              SizedBox(
                width: 120.w,
              ),
              Text(
                'Order',
                style: TextStyle(
                    fontFamily: 'sora',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: const EdgeInsets.all(0),
            width: 320.w,
            decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: TabBar(
                      padding: EdgeInsets.all(3.sp),
                      indicatorColor: ColorType.buttonColor,
                      indicatorWeight: 6.w,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: -15.w),
                      labelColor: Colors.white,
                      unselectedLabelStyle: TextStyle(
                          fontFamily: 'sora',
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp),
                      dividerHeight: 0,
                      labelStyle: const TextStyle(
                          fontFamily: 'sora', fontWeight: FontWeight.w600),
                      indicator: BoxDecoration(
                          color: ColorType.buttonColor,
                          borderRadius: BorderRadius.circular(10)),
                      controller: tabController,
                      tabs: [
                        SizedBox(
                            width: 170.w,
                            height: 30.h,
                            child: const Tab(
                              text: 'Delivery',
                            )),
                        SizedBox(
                          width: 170.w,
                          height: 30.h,
                          child: const Tab(
                            text: 'Pick up',
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, value, child) => Visibility(
              visible: value.cart.isNotEmpty,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Container(
                  color: Colors.white,
                  height: 500.h,
                  width: 320.w,
                  child: TabBarView(controller: tabController, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            'Delivery Address',
                            style: TextStyle(
                                fontFamily: 'sora',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            'Jl. Kpg Sutoyo',
                            style: TextStyle(
                                fontFamily: 'sora',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                            style: TextStyle(
                                fontFamily: 'sora',
                                fontSize: 10.sp,
                                color: const Color(0xff808080),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 22.h,
                              width: 110.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: const Color(0xffDEDEDE))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.w, right: 5.w),
                                    child: SizedBox(
                                        height: 13.h,
                                        width: 13.w,
                                        child: Image.asset(
                                            'assets/images/compose.png')),
                                  ),
                                  Text(
                                    'Edit Address',
                                    style: TextStyle(
                                        fontFamily: 'sora', fontSize: 10.sp),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Container(
                                height: 22.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: const Color(0xffDEDEDE))),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 12.w, right: 5.w),
                                      child: SizedBox(
                                          height: 15.h,
                                          width: 15.w,
                                          child: Image.asset(
                                              'assets/images/document.png')),
                                    ),
                                    Text(
                                      'Add Note',
                                      style: TextStyle(
                                          fontFamily: 'sora', fontSize: 10.sp),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
                          child: Divider(
                            color: const Color(0xffEAEAEA),
                            height: 0.8.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Consumer<CartProvider>(
                            builder: (context, value, child) => SizedBox(
                              height: 60.h,
                              width: 330.w,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w),
                                    child: Container(
                                      height: 45.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  value.cart[0].imageLink!)),
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.h, bottom: 3.h),
                                        child: Text(
                                          value.cart[0].title!,
                                          style: TextStyle(
                                              fontFamily: 'sora',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text(
                                        value.cart[0].extra!,
                                        style: TextStyle(
                                            fontFamily: 'sora',
                                            color: const Color(0xff9B9B9B),
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 50.w),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            value.increaseQuantityWhere(
                                                value.cart[0].extra!,
                                                'decrease');
                                          },
                                          child: Container(
                                            height: 25.h,
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 2,
                                                  color:
                                                      const Color(0xffEAEAEA),
                                                )),
                                            child: const Center(
                                                child: Icon(
                                              Icons.remove,
                                              color: Color(0xffAAADB0),
                                            )),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.w, right: 10.w),
                                          child: Text(
                                            value.cart[0].quatity.toString(),
                                            style: TextStyle(
                                                fontFamily: 'sora',
                                                fontSize: 14.sp),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            value.increaseQuantityWhere(
                                                value.cart[0].extra!,
                                                'increase');
                                          },
                                          child: Container(
                                            height: 25.h,
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 2,
                                                  color:
                                                      const Color(0xffEAEAEA),
                                                )),
                                            child: const Center(
                                                child: Icon(
                                              Icons.add,
                                              color: Color(0xffAAADB0),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Consumer<CartProvider>(
                          builder: (context, value, child) =>
                              value.cart.length <= 1
                                  ? SizedBox(
                                      width: 0.w,
                                      height: 0.w,
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(left: 90.w),
                                      child: GestureDetector(
                                        onTap: () async {
                                          cartDialog(context);
                                        },
                                        child: Text(
                                          '...click to expand cart',
                                          style: TextStyle(
                                              fontFamily: 'sora',
                                              color: ColorType.buttonColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ),
                        ),
                        const Divider(
                          thickness: 5.0,
                          color: ColorType.dividerColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          child: Consumer<CartProvider>(
                            builder: (context, value, child) => value
                                    .discountBox
                                ? SizedBox(
                                    width: 320.w,
                                    height: 43.h,
                                    child: TextField(
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'sora',
                                          fontSize: 18.sp,
                                          color: Colors.white),
                                      decoration: InputDecoration(
                                          focusColor: Colors.black,
                                          hintText: 'Enter coupon code',
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'sora',
                                            color: const Color(0xff989898),
                                            fontSize: 12.sp,
                                          ),
                                          filled: true,
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              value.triggerDiscountBox();
                                              value.getNewDiscountedDeliveryFee(
                                                  'sub');
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                  height: 100.h,
                                                  width: 150.w,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ColorType.buttonColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                      child: Text(
                                                    'Apply Discount',
                                                    style: TextStyle(
                                                        fontFamily: 'sora',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10.sp),
                                                  ))),
                                            ),
                                          ),
                                          fillColor:
                                              ColorType.textFieldFillColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: ColorType
                                                      .textFieldFillColor,
                                                  width: 1.w)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xff313131)))),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      value.triggerDiscountBox();
                                      value.getNewDiscountedDeliveryFee('add');
                                    },
                                    child: Container(
                                      width: 320.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: ColorType.dividerColor,
                                              width: 1.5)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 15.w),
                                            child: SizedBox(
                                                height: 25.h,
                                                width: 25.w,
                                                child: Image.asset(
                                                    'assets/images/discount.png')),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 100.w),
                                            child: Text(
                                              '1 Discount is applied',
                                              style: TextStyle(
                                                  fontFamily: 'sora',
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15.sp,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            'Payment Summary',
                            style: TextStyle(
                                fontFamily: 'sora',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Consumer<CartProvider>(
                            builder: (context, value, child) => Row(
                              children: [
                                Expanded(
                                  flex: 20,
                                  child: Text(
                                    'Price',
                                    style: TextStyle(
                                        fontFamily: 'sora', fontSize: 12.sp),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '\$${value.currentCartEstimate}',
                                    style: TextStyle(
                                        fontFamily: 'sora',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Consumer<CartProvider>(
                          builder: (context, value, child) => Row(
                            children: [
                              Expanded(
                                flex: 25,
                                child: Text(
                                  'Delivery Fee',
                                  style: TextStyle(
                                      fontFamily: 'sora', fontSize: 12.sp),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: value.appliedDiscount
                                      ? Text(
                                          '\$2.0',
                                          style: TextStyle(
                                              fontFamily: 'sora',
                                              fontSize: 10.sp,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : SizedBox(
                                          height: 0.w,
                                          width: 0.w,
                                        )),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  '\$${value.deliveryFee}',
                                  style: TextStyle(
                                      fontFamily: 'sora',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.h, bottom: 8.h),
                          child: Divider(
                            color: ColorType.dividerColor,
                            height: 0.8.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Consumer<CartProvider>(
                            builder: (context, value, child) => Row(
                              children: [
                                Expanded(
                                  flex: 18,
                                  child: Text(
                                    'Total Payment',
                                    style: TextStyle(
                                        fontFamily: 'sora', fontSize: 12.sp),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '\$${value.cartEstimate}',
                                    style: TextStyle(
                                        fontFamily: 'sora',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: SizedBox(
                                  height: 25.h,
                                  width: 25.w,
                                  child:
                                      Image.asset('assets/images/money.png')),
                            ),
                            Container(
                              width: 105.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  color: ColorType.totalContainerColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Consumer<CartProvider>(
                                builder: (context, value, child) => Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 20.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: ColorType.buttonColor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: Text(
                                            'Cash',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'sora',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '\$${value.cartEstimate}',
                                        style: TextStyle(
                                            fontFamily: 'sora',
                                            fontSize: 11.sp),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 150.w),
                              child: SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: Image.asset('assets/images/more.png')),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context)
                              //     .pushNamed(RouteManager.deliveryScreen);

                              StripeCheckout(mounted: mounted, context: context)
                                  .makePayment();
                            },
                            child: Container(
                              width: 320.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: ColorType.buttonColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Order',
                                  style: TextStyle(
                                      fontFamily: 'sora',
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick up',
                          style: TextStyle(
                              fontFamily: 'sora',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String?> cartDialog(BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              content: Container(
                height: 450.h,
                width: 300.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, left: 80.w),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 10.h,
                            width: 10.w,
                            child: Image.asset('assets/images/menu.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: Text(
                              'Cart Extension',
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorType.buttonColor),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                            width: 10.w,
                            child: Image.asset('assets/images/menu.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 400.h,
                        width: 360.w,
                        child: Consumer<CartProvider>(
                          builder: (context, value, child) =>
                              ListView.separated(
                            padding: EdgeInsets.only(top: 10.h),
                            itemCount: value.cart.length,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(left: 12.w, right: 10.w),
                              child: Container(
                                height: 50.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorType.buttonColor),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: CircleAvatar(
                                        maxRadius: 10.sp,
                                        backgroundImage: AssetImage(
                                            value.cart[index].imageLink!),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.w, top: 15.h, right: 20.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.cart[index].title!,
                                            style: TextStyle(
                                                fontFamily: 'sora',
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            value.cart[index].extra!,
                                            style: TextStyle(
                                                fontFamily: 'sora',
                                                color: ColorType.extraTextColor,
                                                fontSize: 7.sp,
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
                                                  value.cart[index].extra!,
                                                  'decrease');
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: ColorType.buttonColor,
                                              size: 15.sp,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          value.cart[index].quatity.toString(),
                                          style: TextStyle(
                                              fontFamily: 'sora',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.w, right: 40.w),
                                          child: GestureDetector(
                                            onTap: () {
                                              value.increaseQuantityWhere(
                                                  value.cart[index].extra!,
                                                  'increase');
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: ColorType.buttonColor,
                                              size: 15.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.h, bottom: 5.h),
                                          child: GestureDetector(
                                            onTap: () =>
                                                value.removeFromCart(index),
                                            child: SizedBox(
                                              height: 15.h,
                                              width: 15.w,
                                              child: Image.asset(
                                                  'assets/images/remove.png'),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '\$${value.cart[index].price!.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontFamily: 'sora',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11.sp),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                          height: 20.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: ColorType.buttonColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'close',
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontSize: 10.sp,
                                  color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ));
  }
}
