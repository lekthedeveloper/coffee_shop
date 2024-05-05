import 'package:coffee_shop/business_logic/video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class VibratingContainer extends StatefulWidget {
  bool tapAction;
  final VoidCallback playVideo;
  final VoidCallback stopVideo;

  VibratingContainer(
      {super.key,
      required this.tapAction,
      required this.playVideo,
      required this.stopVideo});

  @override
  State<VibratingContainer> createState() => _VibratingContainerState();
}

class _VibratingContainerState extends State<VibratingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _vibrating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(5, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Start the animation when the widget is built
    if (!_vibrating) {
      _vibrating = true;
      _controller.repeat(reverse: true);
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _offsetAnimation.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          context.read<VideoProvider>().swapScreen();
          _controller.stop();
          if (context.read<VideoProvider>().condition == true) {
            setState(() {
              widget.playVideo();
            });
          } else {
            widget.stopVideo();
          }
        },
        child: Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.brown,
          ),
          child: Center(
              child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 5.w),
                  child: context.read<VideoProvider>().condition == true
                      ? Text(
                          'Stop Preview',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontFamily: 'sora',
                              fontWeight: FontWeight.w700),
                        )
                      : Text(
                          'Preview Coffee',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontFamily: 'sora',
                              fontWeight: FontWeight.w700),
                        )),
              SizedBox(
                  height: 10.h,
                  width: 10.w,
                  child: context.read<VideoProvider>().condition == true
                      ? Image.asset('assets/images/stop-button.png')
                      : Image.asset('assets/images/play-button.png'))
            ],
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
