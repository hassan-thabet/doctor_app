import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/authentication/cubit/authentication_cubit.dart';
import 'package:doctor_app/modules/authentication/widgets/authentication_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_page_indicator.dart';

class OnboardingSlideBottomSheet extends StatelessWidget {
  final int slideIndex;
  final String title;
  const OnboardingSlideBottomSheet({Key? key, required this.slideIndex, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge
        ),
        const Spacer(),
        (slideIndex != 2)
        ? AuthenticationButtonWidget(
          title: 'Skip',
          backgroundColor: Colors.white,
          titleColor: appMainColor,
          onClick: () {
            Navigator.pushReplacementNamed(context, '/register_screen');
          },
        )
        : const SizedBox.shrink(),
        AuthenticationButtonWidget(
          title: (slideIndex == 2 ) ? 'Start' : 'Next',
          backgroundColor: appMainColor,
          titleColor: Colors.white,
          onClick: () {
            (slideIndex == 2 )
            ? Navigator.pushReplacementNamed(context, '/register_screen')
            : BlocProvider.of<AuthenticationCubit>(context).controller.jumpToPage(slideIndex+1);
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                (i == slideIndex)
                    ? const OnBoardingPageIndicator(isCurrentPage: true)
                    : const OnBoardingPageIndicator(isCurrentPage: false),
            ],
          ),
        ),
      ],
    );
  }
}
