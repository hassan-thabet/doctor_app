import 'dart:developer';

import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/authentication/widgets/authentication_button_widget.dart';
import 'package:doctor_app/modules/authentication/widgets/custom_divider_widget.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset(
                  'assets/images/doctors_background.png',
                  fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Let\'s You in',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(
                height: 2.h,
              ),
              AuthenticationButtonWidget(
                  onClick: ()
                  {
                    log('Login Using google button pressed');
                  },
                  title: 'Login With Google',
                  backgroundColor: Colors.white,
                  titleColor: Colors.black87,
                  imageSource: 'assets/icons/google.png',
              ),
              AuthenticationButtonWidget(
                onClick: ()
                {
                  log('Login Using facebook button pressed');
                },
                title: 'Login With Facebook',
                backgroundColor: Colors.white,
                titleColor: Colors.black87,
                imageSource: 'assets/icons/facebook.png',
              ),
              AuthenticationButtonWidget(
                onClick: ()
                {
                  log('Login Using apple button pressed');
                },
                title: 'Login With apple',
                backgroundColor: Colors.white,
                titleColor: Colors.black87,
                imageSource: 'assets/icons/apple.png',
              ),
              const CustomDividerWidget(label: 'OR',),
              AuthenticationButtonWidget(
                title: 'Sign up using email address',
                backgroundColor: appMainColor,
                titleColor: Colors.white,
                onClick: () {
                  Navigator.pushNamed(context, '/signup_screen');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login_screen');
                      },
                      child: Text(
                          'Login',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: appMainColor)
                          )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
