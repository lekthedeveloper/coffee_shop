import 'package:coffee_shop/models/color_model.dart';
import 'package:coffee_shop/widgets/add_to_cart_animation.dart';
import 'package:coffee_shop/widgets/baner_widget.dart';
import 'package:coffee_shop/widgets/category_tab.dart';
import 'package:coffee_shop/widgets/header_widget.dart';
import 'package:coffee_shop/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0.h,
            child: Container(
              height: 350.h,
              width: 450.w,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    ColorType.gradientColorDark,
                    ColorType.gradientColorLight,
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  //Header Widget
                  const Header(),
                  Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 25.h),
                      child:
                          const CustomSearchBar()), //This is the search bar widget
                ],
              ),
            )),
        Positioned(
            top: 248.h,
            bottom: 0.h,
            right: 0.w,
            left: 0.w,
            child: const CoffeeCategoryTab()),

        //////////////////////Cart pop up notification///////////////
        Positioned(
            top: 400.h,
            left: 100.w,
            child: const AddtoCartAnimation(
              animationType: 'addtocart',
            )),
        Positioned(
            top: 400.h,
            left: 100.w,
            child: const AddtoCartAnimation(animationType: '')),
        //////////////////////////////////
        Positioned(top: 190.h, left: 24.w, child: const BannerWidget()),
      ]),
    );
  }
}
