import 'dart:developer';

import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/authentication/cubit/authentication_cubit.dart';
import 'package:doctor_app/modules/authentication/cubit/authentication_states.dart';
import 'package:doctor_app/modules/authentication/widgets/authentication_button_widget.dart';
import 'package:doctor_app/modules/authentication/widgets/authentication_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Fill your profile',
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
                      height: 4.h,
                    ),
                    InkWell(
                      onTap: (){
                        // choose image from gallery will be here
                      },
                      child: SizedBox(
                          height: 16.h,
                          width: 16.h,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage('assets/images/placeholder.png'),
                              ),
                              Positioned(
                                  bottom: -12,
                                  right: -20,
                                  child: RawMaterialButton(
                                    onPressed: ()
                                    {
                                      // choose image from gallery will be here
                                    },
                                    elevation: 4,
                                    fillColor: Colors.white,
                                    shape: const CircleBorder(),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: appMainColor,
                                      size: 18,
                                    ),
                                  ))
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    AuthenticationTextFieldWidget(
                      onSaved: (value)
                      {
                        log(value.toString());
                      },
                      label: 'Full Name',
                      iconData: Icons.person_outline_rounded,
                      iconColor: appMainColor,
                      isPassword: false,
                      // suffixIconData: suffixIconData
                    ),
                    AuthenticationTextFieldWidget(
                      onSaved: (value)
                      {
                        log(value.toString());
                      },
                      label: 'Nickname',
                      iconData: Icons.person_outline_rounded,
                      iconColor: appMainColor,
                      isPassword: false,
                      // suffixIconData: suffixIconData
                    ),

                    AuthenticationTextFieldWidget(
                      onSaved: (value)
                      {
                        log(value.toString());
                      },
                      label: 'E-mail',
                      iconData: Icons.email_outlined,
                      iconColor: appMainColor,
                      isPassword: false,
                      // suffixIconData: suffixIconData
                    ),
                    BlocBuilder<AuthenticationCubit , AuthenticationStates>(
                        builder: (context , state)
                        {
                          return AuthenticationTextFieldWidget(
                            onSaved: (value)
                            {
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
                        }
                    ),


                    AuthenticationTextFieldWidget(
                      onSaved: (value)
                      {
                        log(value.toString());
                      },
                      label: 'Date of birth',
                      iconData: Icons.looks_one_outlined,
                      iconColor: appMainColor,
                      isPassword: false,
                      suffixIconData: Icons.calendar_today,
                      onSuffixIconClick: () async
                      {
                        await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate:DateTime(1920),
                            lastDate: DateTime(2101)
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),

                    AuthenticationButtonWidget(
                      title: 'Sign up',
                      backgroundColor: appMainColor,
                      titleColor: Colors.white,
                      onClick: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/main_screen' , (_) => false);
                      },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}