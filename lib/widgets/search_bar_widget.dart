import 'package:coffee_shop/routes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/color_model.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Navigator.of(context).pushNamed(RouteManager.coffeeSearch);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      height: 43.h,
      child: TextField(
        focusNode: _focusNode,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            focusColor: Colors.black,
            hintText: 'Search Coffee',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'sora',
              color: const Color(0xff989898),
              fontSize: 12.sp,
            ),
            filled: true,
            suffixIcon: GestureDetector(
              onTap: () => debugPrint('its working'),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    height: 100.h,
                    width: 43.w,
                    decoration: BoxDecoration(
                        color: ColorType.buttonColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/images/filter_icon.png')),
              ),
            ),
            prefixIcon: Image.asset('assets/images/search_icon.png'),
            fillColor: const Color(0xff313131),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: const Color(0xff313131), width: 1.w)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xff313131)))),
      ),
    );
  }
}
