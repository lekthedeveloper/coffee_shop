import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:typewritertext/typewritertext.dart';

class BannerWidget extends StatelessWidget {
  final bool loadingCondition;
  const BannerWidget({super.key, required this.loadingCondition});

  @override
  Widget build(BuildContext context) {
    return loadingCondition
        ? Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.grey[400]!,
            child: Container(
              height: 120.h,
              width: 310.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
            ))
        : Container(
            height: 120.h,
            width: 310.w,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/background_image.png')),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                  child: Container(
                    height: 21.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffED5151),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Promo',
                      style: TextStyle(
                          fontFamily: 'sora',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 25.h,
                      left: 20.w,
                      child: Container(
                        width: 178.h,
                        height: 29.w,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      top: 59.h,
                      left: 20.w,
                      child: Container(
                        width: 150.w,
                        height: 20.h,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w, top: 14.h),
                      child: TypeWriterText(
                        duration: const Duration(milliseconds: 100),
                        text: Text(
                          ' Buy one get \n one FREE',
                          style: TextStyle(
                            fontFamily: 'sora',
                            fontSize: 30.sp,
                            height: 1
                                .h, // Adjust this value to control the space between lines
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left, // or TextAlign.start
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
  }
}
