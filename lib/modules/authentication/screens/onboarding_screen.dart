import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/authentication/cubit/authentication_states.dart';
import 'package:doctor_app/modules/authentication/widgets/on_boarding_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/authentication_cubit.dart';
import '../widgets/on_boarding_slide_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      body: SizedBox(
          height: 70.h,
          width: 100.w,
          child: BlocBuilder<AuthenticationCubit , AuthenticationStates>(
              builder: (context , state)
              {


                return PageView(
                  onPageChanged: (pageIndex) {
                    BlocProvider.of<AuthenticationCubit>(context)
                        .onSlideChange(pageIndex);
                  },
                  controller:
                  BlocProvider.of<AuthenticationCubit>(context).controller,
                  children: const <Widget>[
                    OnBoardingSlideWidget('assets/images/doctor_1.png'),
                    OnBoardingSlideWidget('assets/images/doctor_2.png'),
                    OnBoardingSlideWidget('assets/images/doctor_3.png'),
                  ],
                );
              }
          )
      ),
      bottomSheet: Container(
        color: appMainColor,
        child: Container(
          height: 30.h,
          width: 100.w,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              color: Colors.white),
          child: BlocBuilder<AuthenticationCubit, AuthenticationStates>(
              builder: (context, state) {
            if (state is OnBoardingSlideChangeState) {
              if (state.slideIndex == 2) {
                return OnboardingSlideBottomSheet(
                  slideIndex: state.slideIndex,
                  title: 'Live talk with doctor ',
                );
              }

              return OnboardingSlideBottomSheet(
                slideIndex: state.slideIndex,
                title: (state.slideIndex == 0)
                    ? 'Thousands of Doctors '
                    : 'Chat with Doctor',
              );
            }

            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
