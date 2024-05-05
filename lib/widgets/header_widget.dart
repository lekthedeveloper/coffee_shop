import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String country = '';
  String state = '';
  bool isLoading = true; // Added boolean to track loading state
  bool isLocationFetched =
      false; // Added boolean to track if location is fetched

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> _fetchLocationData() async {
    // Check if location is already fetched
    if (isLocationFetched) {
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        setState(() {
          country = placemarks.first.country ?? 'N/A';
          state = placemarks.first.administrativeArea ?? 'N/A';
          isLoading = false; // Set loading to false
          isLocationFetched = true; // Set location fetched to true
        });
      }
    } catch (e) {
      debugPrint("Error getting location: $e");
      isLoading = false; // Set loading to false on error
    }
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle denied permission
    } else if (permission == LocationPermission.deniedForever) {
      // Handle denied forever permission
    } else {
      _fetchLocationData();
      // Permission granted, you can proceed with location-related tasks
    }
  }

  @override
  Widget build(BuildContext context) {
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
            // Conditional rendering of Shimmer or Text widget
            isLoading
                ? _buildShimmer() // Show shimmer while loading
                : _buildLocationText(), // Show location text
          ],
        ),
        SizedBox(
          width: 141.w,
        ),
        isLoading
            ? _buildProfileShimmer()
            : Container(
                height: 35.h,
                width: 40.w,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/profile.png')),
                    borderRadius: BorderRadius.circular(17)),
              )
      ],
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      width: 127.w,
      height: 12.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[700]!,
        highlightColor: Colors.grey[600]!,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget _buildProfileShimmer() {
    return SizedBox(
      width: 40.w,
      height: 35.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[700]!,
        highlightColor: Colors.grey[600]!,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget _buildLocationText() {
    return Row(
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
    );
  }
}
