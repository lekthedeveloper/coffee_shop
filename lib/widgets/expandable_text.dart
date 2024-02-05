// ignore_for_file: library_private_types_in_public_api

import 'package:coffee_shop/models/color_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableTextWidget({
    Key? key,
    required this.text,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState:
              isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Text(
            widget.text,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'sora',
                color: ColorType.extraTextColor),
          ),
          secondChild: Text(
            textAlign: TextAlign.justify,
            '${widget.text.substring(
              0,
            )} ',
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                height: 1.2.h,
                fontSize: 14,
                fontFamily: 'sora',
                color: ColorType.extraTextColor),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Collapse' : 'Read More',
            style: isExpanded
                ? TextStyle(
                    fontFamily: 'sora',
                    fontSize: 12.sp,
                    color: ColorType.buttonColor,
                    fontWeight: FontWeight.w600,
                  )
                : TextStyle(
                    fontFamily: 'sora',
                    fontSize: 12.sp,
                    color: ColorType.buttonColor,
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ),
      ],
    );
  }
}
