import 'dart:developer';

import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/authentication/cubit/authentication_cubit.dart';
import 'package:doctor_app/modules/authentication/cubit/authentication_states.dart';
import 'package:doctor_app/modules/authentication/widgets/authentication_button_widget.dart';
import 'package:doctor_app/modules/authentication/widgets/authentication_text_field_widget.dart';
import 'package:doctor_app/modules/authentication/widgets/custom_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          alignment: Alignment.center,
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Image.asset(
                  'assets/app_icon.png',
                  color: appMainColor,
                  width: 35.w,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Welcome back ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 5.h,
                ),
                AuthenticationTextFieldWidget(
                  onSaved: (value) {
                    log(value.toString());
                  },
                  label: 'E-mail',
                  iconData: Icons.email_outlined,
                  iconColor: appMainColor,
                  isPassword: false,
                  // suffixIconData: suffixIconData
                ),
                BlocBuilder<AuthenticationCubit, AuthenticationStates>(
                  builder: (context , state) {
                    return AuthenticationTextFieldWidget(
                      onSaved: (value) {
                        log(value.toString());
                      },
                      label: 'Password',
                      iconData: Icons.looks_one_outlined,
                      iconColor: appMainColor,
                      isPassword: BlocProvider.of<AuthenticationCubit>(context).visibility,
                      suffixIconData: Icons.visibility_rounded,
                      onSuffixIconClick: (){
                        BlocProvider.of<AuthenticationCubit>(context).onVisibilityButtonClick();
                      },
                    );
                  },

                ),
                SizedBox(
                  height: 8.h,
                ),
                AuthenticationButtonWidget(
                  title: 'Login',
                  backgroundColor: appMainColor,
                  titleColor: Colors.white,
                  onClick: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/main_screen' , (_) => false);
                  },
                ),
                const CustomDividerWidget(label: 'Or continue with'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/apple.png'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/google.png'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/facebook.png'),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup_screen');
                        },
                        child: Text('Sign up',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: appMainColor))),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
