
import 'package:doctor_app/modules/authentication/cubit/authentication_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates>{
  AuthenticationCubit() : super(InitialState());
  // onboarding pageView Controller
  PageController controller = PageController();
  bool visibility = true;
  // On App Start
  // Splash screen cubit
  startSplashPage() async {
    await Future.delayed(const Duration(seconds: 3));

    // here we will check if user is auth or no ?
    bool isAuth = false ;
    // if user is not authenticated we will check
    // if this user opened this application before or is it the first time
    bool isFirstTime = true ;

    emit(SplashScreenLoadedState(isAuth: isAuth, isFirstTime: isFirstTime));
  }

  // onBoarding screen cubit
  onSlideChange(int slideIndex) {
    emit(OnBoardingSlideChangeState(slideIndex: slideIndex));
  }


  onVisibilityButtonClick() {
    visibility = !visibility;
    emit(VisibilityButtonClickedState());
  }
}