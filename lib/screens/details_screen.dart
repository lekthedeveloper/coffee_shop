import 'package:coffee_shop/business_logic/cart_provider.dart';
import 'package:coffee_shop/business_logic/category_provider.dart';
import 'package:coffee_shop/business_logic/favourite_provider.dart';
import 'package:coffee_shop/models/color_model.dart';
import 'package:coffee_shop/routes_controller.dart';
import 'package:coffee_shop/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final String? title;
  final String? image;
  final String? extra;
  final String? description;
  final double? price;
  final double? rating;
  final bool isFavourite;
  const DetailsScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.extra,
      required this.description,
      required this.price,
      required this.rating,
      required this.isFavourite});
  final bool condition = true;
  @override
  Widget build(BuildContext context) {
    debugPrint(isFavourite.toString());
    return Scaffold(
      backgroundColor: ColorType.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Consumer<CoffeeCategoryProvider>(
                builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios)),
              ),
              SizedBox(
                width: 115.w,
              ),
              Text(
                'Detail',
                style: TextStyle(
                    fontFamily: 'sora',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 115.w,
              ),
              Consumer<FavouriteProvider>(
                builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      value.toggleFavourite(
                          extra: extra!,
                          image: image!,
                          price: price!,
                          title: title!);
                    },
                    child: value.isCoffeeFavourite(extra!)
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/favourite.png'))
                        : SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/heart.png'))),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.w),
            child: Container(
              height: 190.h,
              width: 320.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image!), fit: BoxFit.cover),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h),
            child: Text(
              title!,
              style: TextStyle(
                  fontFamily: 'sora',
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 4.h),
            child: Text(
              'with Chocolate',
              style: TextStyle(
                  fontFamily: 'sora',
                  fontSize: 10.sp,
                  color: ColorType.extraTextColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w, top: 5.0.h),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 18.sp,
                  color: ColorType.iconColor,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: Text(
                    rating.toString(),
                    style: TextStyle(
                        fontFamily: 'sora',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Text(
                  '(230)',
                  style: TextStyle(
                      fontFamily: 'sora',
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorType.extraTextColor),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 150.w, right: 10.h),
                  child: Container(
                    height: 40.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                        color: ColorType.iconBoxColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/images/coffee_icon.png'),
                  ),
                ),
                Container(
                  height: 40.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color: ColorType.iconBoxColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset('assets/images/milk.png'),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: const Divider(
              thickness: 1.7,
              color: ColorType.dividerColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
            ),
            child: Text(
              'Description',
              style: TextStyle(
                  fontFamily: 'sora',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 6.h, left: 20.w, right: 20.w, top: 10.h),
            child: ExpandableTextWidget(text: description!),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(
              'Size',
              style: TextStyle(
                  fontFamily: 'sora',
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.w, top: 5.h),
              child: Consumer<CoffeeCategoryProvider>(
                builder: (context, value, child) => SizedBox(
                  height: 35.h,
                  width: 500.w,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            value.coffeeSizeSelection(
                                index,
                                value.coffeeOutLineColor,
                                value.coffeeSizeBgColor,
                                value.coffSizeTextColor);
                          },
                          child: Container(
                            height: 50.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                color: value.coffeSizeDefaultColor[index]
                                    ? ColorType.borderLineColor
                                    : value.coffeeSizeBgColor[index],
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: value.coffeSizeDefaultColor[index]
                                        ? ColorType.buttonColor
                                        : value.coffeeOutLineColor[index],
                                    width: 1.5)),
                            child: Center(
                                child: Text(
                              value.sized[index],
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: value.coffeSizeDefaultColor[index]
                                      ? ColorType.buttonColor
                                      : value.coffSizeTextColor[index]),
                            )),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20.w,
                          ),
                      itemCount: value.sized.length),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromARGB(206, 249, 247, 247),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.h, bottom: 5.w),
                  child: Text(
                    'Price',
                    style: TextStyle(
                        fontFamily: 'sora',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorType.extraTextColor),
                  ),
                ),
                Text(
                  '\$${price!.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontFamily: 'sora',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorType.buttonColor),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w, bottom: 20.h, top: 20.h),
              child: GestureDetector(
                onTap: () {
                  context.read<CartProvider>().newCartItem(
                      price: price!,
                      imageLink: image!,
                      extra: extra!,
                      quatity: 1,
                      size: 'S',
                      title: title!);
                  Navigator.of(context).pushNamed(RouteManager.orderScreen);
                },
                child: Container(
                  height: 55.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      color: ColorType.buttonColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'sora',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
