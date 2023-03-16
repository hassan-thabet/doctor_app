import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/authentication/cubit/authentication_cubit.dart';
import 'package:doctor_app/modules/authentication/cubit/authentication_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationStates>(
      listener: (context, state) {
        if (state is SplashScreenLoadedState) {
          // if user is not auth and his first time open the app
          // We will do Navigate  to Onboarding screen
          if (state.isAuth == false && state.isFirstTime == true) {
            Navigator.pushReplacementNamed(context, '/onboarding_screen');
            BlocProvider.of<AuthenticationCubit>(context).onSlideChange(0);
          }
          // if user is not auth but his not first time open the app
          // We will do Navigate  to Login screen
          if (state.isAuth == false && state.isFirstTime == false) {
            Navigator.pushReplacementNamed(context, '/login_screen');

          }
          // if user is authenticated
          // We will do Navigate  to Home screen
          if (state.isAuth == true ) {
            Navigator.pushReplacementNamed(context,'/main_screen');
          }
        }
      },
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          color: appMainColor,
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/app_icon.png' ,
                  width: 35.w,
                ),
                SizedBox(height: 2.h,),
                const Text(
                  'Doctor App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
