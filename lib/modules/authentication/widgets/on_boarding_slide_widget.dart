import 'package:doctor_app/core/extensions.dart';
import 'package:flutter/material.dart';

class OnBoardingSlideWidget extends StatelessWidget {
  final String imagePath ;
  const OnBoardingSlideWidget(this.imagePath,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Image.asset(
        imagePath ,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
