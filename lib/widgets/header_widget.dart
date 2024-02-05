import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String country = '';
  String state = '';
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        if (mounted) {
          setState(() {
            country = placemarks.first.country ?? 'N/A';
            state = placemarks.first.administrativeArea ?? 'N/A';
          });
        }
      }
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle denied permission
    } else if (permission == LocationPermission.deniedForever) {
      // Handle denied forever permission
    } else {
      _getCurrentLocation();
      // Permission granted, you can proceed with location-related tasks
    }
  }

  @override
  void initState() {
    requestLocationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('$country $state');

    return Row(
      children: [
        SizedBox(
          width: 20.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: Text(
                'Location',
                style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'sora',
                    color: const Color(0xffB7B7B7)),
              ),
            ),
            country == '' && state == ''
                ? SizedBox(
                    width: 127.w,
                  )
                : Row(
                    children: [
                      Text(
                        '$country, $state',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'sora',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffDDDDDD)),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Image.asset('assets/images/arrow_down.png')
                    ],
                  ),
          ],
        ),
        SizedBox(
          width: 140.w,
        ),
        Container(
          height: 35.h,
          width: 40.w,
          decoration: BoxDecoration(
              color: Colors.green,
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/profile.png')),
              borderRadius: BorderRadius.circular(17)),
        )
      ],
    );
  }
}
