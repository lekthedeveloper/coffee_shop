import 'package:cherry_toast/cherry_toast.dart';
import 'package:coffee_shop/business_logic/cart_provider.dart';
import 'package:coffee_shop/business_logic/category_provider.dart';
import 'package:coffee_shop/business_logic/favourite_provider.dart';
import 'package:coffee_shop/business_logic/video_provider.dart';
import 'package:coffee_shop/models/color_model.dart';
import 'package:coffee_shop/routes_controller.dart';
import 'package:coffee_shop/widgets/expandable_text.dart';
import 'package:coffee_shop/widgets/vibrate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DetailsScreen extends StatefulWidget {
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

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _decorationAnimation;
  final bool condition = false;
  bool b = true;
  late VideoPlayerController _videocontroller;

  @override
  void initState() {
    _videocontroller = VideoPlayerController.asset('assets/video.mp4');
    _videocontroller.addListener(() {
      setState(() {});
    });
    _videocontroller.setLooping(true);
    _videocontroller.initialize().then((_) => setState(() {}));

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
            Color.fromARGB(128, 241, 230, 223),
            Colors.white,
          ], // Initial colors
        ),
      ),
      end: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white,
            Color.fromARGB(51, 238, 231, 227),
          ], // Final colors
        ),
      ),
    ).animate(_controller);
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _videocontroller.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(b.toString());
    return Scaffold(
      backgroundColor: ColorType.backgroundColor,
      body: AnimationLimiter(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Container(
            decoration: _decorationAnimation.value,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(child: widget),
                  ),
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
                                value.coffeeSizeDefaultSettings();
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
                                CherryToast(
                                        themeColor: const Color(0xffC67C4E),
                                        icon: Icons.favorite,
                                        iconColor: const Color(0xffC67C4E),
                                        animationCurve: Curves.linearToEaseOut,
                                        title: Text(
                                            value.isCoffeeFavourite(
                                                    widget.extra!)
                                                ? 'Removed from Favourite'
                                                : 'Added to Favourite',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xffC67C4E),
                                                fontFamily: 'sora')))
                                    .show(context);
                                value.toggleFavourite(
                                    extra: widget.extra!,
                                    image: widget.image!,
                                    price: widget.price!,
                                    title: widget.title!);
                              },
                              child: value.isCoffeeFavourite(widget.extra!)
                                  ? SizedBox(
                                      height: 20.h,
                                      width: 20.w,
                                      child: Image.asset(
                                          'assets/images/favourite.png'))
                                  : SizedBox(
                                      height: 20.h,
                                      width: 20.w,
                                      child: Image.asset(
                                          'assets/images/heart.png'))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: Hero(
                        tag: widget.image!,
                        child: Consumer<VideoProvider>(
                          builder: (context, value, child) => value.condition
                              ? Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.none,
                                      height: 190.h,
                                      width: 320.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: _videocontroller
                                                .value.isInitialized
                                            ? Column(
                                                children: [
                                                  Visibility(
                                                      visible: context
                                                          .read<VideoProvider>()
                                                          .condition,
                                                      child: Container(
                                                          width: 330.w,
                                                          height: 24.h,
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Colors.brown,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10))),
                                                          child: Marquee(
                                                            text:
                                                                'Craving a cozy cup of perfection? Try our Cuppacino Coffee! ☕ Indulge in rich, aromatic bliss with every sip. Savor the moment. ',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'sora',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            scrollAxis:
                                                                Axis.horizontal,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            blankSpace:
                                                                20.0, // Adjust blank space between texts
                                                            velocity:
                                                                50.0, // Adjust speed of scrolling
                                                            pauseAfterRound:
                                                                const Duration(
                                                                    seconds:
                                                                        1), // Pause after each loop
                                                            startPadding:
                                                                10.0, // Adjust space before scrolling starts
                                                            accelerationDuration:
                                                                const Duration(
                                                                    seconds:
                                                                        1), // Adjust acceleration duration
                                                            accelerationCurve:
                                                                Curves
                                                                    .linear, // Adjust acceleration curve
                                                            decelerationDuration:
                                                                const Duration(
                                                                    seconds:
                                                                        1), // Adjust deceleration duration
                                                            decelerationCurve:
                                                                Curves
                                                                    .linear, // Adjust deceleration curve
                                                          ))),
                                                  AspectRatio(
                                                    aspectRatio:
                                                        _videocontroller
                                                            .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        _videocontroller),
                                                  ),
                                                ],
                                              )
                                            : const CircularProgressIndicator(),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  height: 190.h,
                                  width: 320.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(widget.image!),
                                          fit: BoxFit.cover),
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.w, top: 10.h),
                      child: SizedBox(
                        //color: Colors.red,
                        width: 320.w,
                        height: 40.h,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title!,
                                  style: TextStyle(
                                      fontFamily: 'sora',
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  widget.extra.toString(),
                                  style: TextStyle(
                                      fontFamily: 'sora',
                                      fontSize: 10.sp,
                                      color: ColorType.extraTextColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 96.w,
                            ),
                            VibratingContainer(
                              tapAction: condition,
                              playVideo: () {
                                _videocontroller.play();
                              },
                              stopVideo: () {
                                _videocontroller.pause();
                                _videocontroller.seekTo(Duration.zero);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 20.w, top: 10.h),
                    //   child: Text(
                    //     title!,
                    //     style: TextStyle(
                    //         fontFamily: 'sora',
                    //         fontSize: 15.sp,
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 20.w, top: 4.h),
                    //   child: Text(
                    //     extra.toString(),
                    //     style: TextStyle(
                    //         fontFamily: 'sora',
                    //         fontSize: 10.sp,
                    //         color: ColorType.extraTextColor,
                    //         fontWeight: FontWeight.w400),
                    //   ),
                    // ),

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
                              widget.rating.toString(),
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
                              child:
                                  Image.asset('assets/images/coffee_icon.png'),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
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
                          bottom: 6.h, left: 20.w, right: 20.w, top: 6.h),
                      child: ExpandableTextWidget(text: widget.description!),
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
                                          color: value
                                                  .coffeSizeDefaultColor[index]
                                              ? ColorType.borderLineColor
                                              : value.coffeeSizeBgColor[index],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: value.coffeSizeDefaultColor[
                                                      index]
                                                  ? ColorType.buttonColor
                                                  : value.coffeeOutLineColor[
                                                      index],
                                              width: 1.5)),
                                      child: Center(
                                          child: Text(
                                        value.sized[index],
                                        style: TextStyle(
                                            fontFamily: 'sora',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: value.coffeSizeDefaultColor[
                                                    index]
                                                ? ColorType.buttonColor
                                                : value
                                                    .coffSizeTextColor[index]),
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
                )),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Container(
          height: 90.h,
          decoration: _decorationAnimation.value,
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
                    '\$${widget.price!.toStringAsFixed(2)}',
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
                        price: widget.price!,
                        imageLink: widget.image!,
                        extra: widget.extra!,
                        quatity: 1,
                        size: 'S',
                        title: widget.title!);
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
      ),
    );
  }
}
