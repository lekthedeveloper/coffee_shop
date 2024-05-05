import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../models/color_model.dart';
import '../widgets/add_to_cart_animation.dart';
import '../widgets/baner_widget.dart';
import '../widgets/category_tab.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _decorationAnimation;
  bool condition = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        condition = false;
      });
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust duration as needed
    );

    _decorationAnimation = DecorationTween(
      begin: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            ColorType.gradientColorDark,
            ColorType.gradientColorLight,
          ], // Initial colors
        ),
      ),
      end: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            ColorType.gradientColorLight,
            ColorType.gradientColorDark,
          ], // Final colors
        ),
      ),
    ).animate(_controller);

    _controller.repeat(reverse: true); // Repeat the animation

    // If you want to use the animation in another widget, use setState() to trigger rebuilds
    // or use the animation directly in the AnimatedContainer's decoration
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return AnimationLimiter(
          child: Stack(children: [
            Positioned(
              top: 0.h,
              child: Container(
                height: 350,
                width: 450,
                decoration: _decorationAnimation.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    const Header(),
                    Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 25.h),
                        child: const CustomSearchBar()),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 248.h,
                bottom: 0.h,
                right: 0.w,
                left: 0.w,
                child: CoffeeCategoryTab(
                  condition: condition,
                )),

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
            Positioned(
                top: 190.h,
                left: 24.w,
                child: BannerWidget(
                  loadingCondition: condition,
                )),
          ]),
        );
      },
    );
  }
}
