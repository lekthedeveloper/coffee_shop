import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../business_logic/category_provider.dart';

import '../models/coffee_model.dart';
import '../models/color_model.dart';
import 'animated_product_item.dart';

class CoffeeCategoryTab extends StatefulWidget {
  final bool condition;
  const CoffeeCategoryTab({
    super.key,
    this.condition = true,
  });

  @override
  State<CoffeeCategoryTab> createState() => _CoffeeCategoryTabState();
}

class _CoffeeCategoryTabState extends State<CoffeeCategoryTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fetchName = context.read<CoffeeCategoryProvider>().name;
    return Container(
      height: 800.h,
      width: 450.w,
      color: ColorType.iconBoxColor,
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Consumer<CoffeeCategoryProvider>(
            builder: (context, value, child) => SizedBox(
              width: 400.w,
              height: 34.h,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (widget.condition) {
                      return Shimmer.fromColors(
                          direction: ShimmerDirection.ltr,
                          baseColor: Colors.grey[100]!,
                          highlightColor: Colors.grey[400]!,
                          child: Container(
                            height: 45.h,
                            width: 110.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                            ),
                          ));
                    } else {
                      return GestureDetector(
                        onTap: () => value.changeTab(
                            index,
                            value.categoryBoxColor,
                            value.textColor,
                            value.fontWeight),
                        child: Container(
                          height: 45.h,
                          width: 110.w,
                          decoration: BoxDecoration(
                              color: value.defaultColor[index]
                                  ? ColorType.buttonColor
                                  : value.categoryBoxColor[index],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              categories[index].name!,
                              style: TextStyle(
                                  fontFamily: 'sora',
                                  fontSize: 12.sp,
                                  fontWeight: value.defaultColor[index]
                                      ? FontWeight.w600
                                      : value.fontWeight[index],
                                  color: value.defaultColor[index]
                                      ? Colors.white
                                      : value.textColor[index]),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                  itemCount: categories.length),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
              child: ProductItemListing(
            condition: widget.condition,
            listType: context
                .read<CoffeeCategoryProvider>()
                .getCappuccinoItems(fetchName),
          ))
        ],
      ),
    );
  }
}
