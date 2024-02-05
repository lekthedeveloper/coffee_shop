import 'package:coffee_shop/business_logic/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/color_model.dart';

class FavourtieScreen extends StatelessWidget {
  const FavourtieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  padding: EdgeInsets.only(left: 10.w, right: 110.w),
                  child: SizedBox(
                    height: 25.h,
                    width: 25.w,
                    child: Image.asset('assets/images/icon.png'),
                  )),
              Padding(
                padding: EdgeInsets.only(right: 100.w),
                child: Text(
                  'favourites',
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
              'My favourites',
              style: TextStyle(
                  fontFamily: 'sora',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Consumer<FavouriteProvider>(
            builder: (context, value, child) => Visibility(
                visible: value.favourites.isEmpty,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: SizedBox(
                            height: 1.h,
                            width: 300.w,
                            child: LottieBuilder.asset(
                                fit: BoxFit.cover,
                                'assets/lottie_files/coffee_fav.json')),
                      ),
                    ),
                    Positioned(
                      top: 250.h,
                      left: 120.w,
                      child: Text(
                        'No favourite yet',
                        style: TextStyle(
                            fontFamily: 'sora',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 417.h,
            width: 340.w,
            child: Consumer<FavouriteProvider>(
              builder: (context, value, child) => ListView.separated(
                padding: const EdgeInsets.all(0),
                itemCount: value.favourites.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                  ),
                  child: Container(
                    height: 70.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorType.buttonColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Container(
                              height: 50.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          value.favourites[index].image!))),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, top: 23.h, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value.favourites[index].title!,
                                style: TextStyle(
                                    fontFamily: 'sora',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                value.favourites[index].extraIngredient!,
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
                            Text(
                              '\$${value.favourites[index].price!.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: GestureDetector(
                                onTap: () {
                                  value.removeFavourite(
                                      value.favourites[index].extraIngredient!);
                                },
                                child: SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child:
                                      Image.asset('assets/images/remove.png'),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
