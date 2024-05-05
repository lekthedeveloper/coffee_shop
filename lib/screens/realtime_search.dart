import 'package:coffee_shop/routes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

import '../models/coffee_model.dart';

class CoffeePage extends StatefulWidget {
  const CoffeePage({Key? key}) : super(key: key);

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  List<CoffeeModel> filteredCoffeeList = [];
  String query = '';

  @override
  void initState() {
    super.initState();
  }

  List<CoffeeModel> getAllCoffeeModels() {
    List<CoffeeModel> allCoffeeModels = [];
    for (var category in categories) {
      allCoffeeModels.addAll(category.items!);
    }
    return allCoffeeModels;
  }

  void filterCoffeeList(String newQuery) {
    setState(() {
      query = newQuery.trim().toLowerCase();

      if (query.isNotEmpty) {
        filteredCoffeeList = getAllCoffeeModels()
            .where((coffee) =>
                coffee.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        // Reset the filtered list when the query is empty
        filteredCoffeeList = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 110.w),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(RouteManager.homepage),
                    child: SizedBox(
                        height: 25.h,
                        width: 25.w,
                        child: const Icon(Icons.arrow_back_ios)),
                  )),
              Padding(
                padding: EdgeInsets.only(right: 125.w),
                child: Text(
                  'Search',
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
            padding: EdgeInsets.only(top: 20.h, bottom: 20),
            child: SizedBox(
              height: 40.h,
              width: 320.w,
              child: TextField(
                onChanged: filterCoffeeList,
                decoration: InputDecoration(
                  prefixIcon: SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: Image.asset('assets/images/glass.png')),
                  fillColor: const Color(0xff313131),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: const Color(0xff313131), width: 1.w)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff313131))),
                  hintText: 'Search Coffee',
                ),
              ),
            ),
          ),
          if (query.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Please enter your preferred search.',
                style: TextStyle(fontFamily: 'sora'),
              ),
            )
          else if (filteredCoffeeList.isEmpty)
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: LottieBuilder.asset('assets/lottie_files/search.json'),
            )
          else
            Expanded(
              child: AnimationLimiter(
                child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5.h,
                  ),
                  itemCount: filteredCoffeeList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RouteManager.detailsScreen,
                              arguments: {
                                'title': filteredCoffeeList[index].title,
                                'price': filteredCoffeeList[index].price,
                                'extra':
                                    filteredCoffeeList[index].extraIngredient,
                                'image': filteredCoffeeList[index].image,
                                'description':
                                    filteredCoffeeList[index].description,
                                'rating': filteredCoffeeList[index].rating,
                                'isFavourite':
                                    filteredCoffeeList[index].isFavourite
                              });
                        },
                        child: AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Container(
                                height: 50.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 6.w, right: 10.w),
                                      child: const CircleAvatar(
                                        backgroundColor: Color(0xffFFF5EE),
                                        backgroundImage: AssetImage(
                                          'assets/images/coffee.png',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        filteredCoffeeList[index].title!,
                                        style: TextStyle(
                                            fontFamily: 'sora',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        height: 20.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                              148, 224, 224, 224),
                                        ),
                                        child: Center(
                                          child: Text(
                                            filteredCoffeeList[index]
                                                .extraIngredient!,
                                            style: TextStyle(
                                                fontFamily: 'sora',
                                                fontSize: 8.sp,
                                                fontStyle: FontStyle.italic,
                                                color: const Color.fromARGB(
                                                    255, 133, 128, 128)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          height: 20.h,
                                          width: 20.w,
                                          child: Image.asset(
                                              'assets/images/click.png')),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
