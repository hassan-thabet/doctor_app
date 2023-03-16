import 'package:doctor_app/core/extensions.dart';
import 'package:flutter/material.dart';

class AuthenticationButtonWidget extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final String? imageSource;
  final Color backgroundColor;
  final Color titleColor;

  const AuthenticationButtonWidget({
    super.key,
    required this.onClick,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    this.imageSource
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        //height: 5.h,
        width: 80.w,
        child: MaterialButton(
          onPressed: onClick,
          color: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(

              mainAxisAlignment: (imageSource != null) ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                (imageSource != null)
                ? Padding(
                  padding: const EdgeInsets.only(right: 12 , left: 10),
                  child: Image.asset(imageSource! , width: 32, height: 32,),
                )
                : const SizedBox.shrink(),
                SizedBox(width: 1.w),
                Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
