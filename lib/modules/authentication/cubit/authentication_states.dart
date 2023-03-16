abstract class AuthenticationStates {}

class InitialState extends AuthenticationStates {}

class SplashScreenLoadedState extends AuthenticationStates {
  final bool isAuth;
  final bool isFirstTime;
  SplashScreenLoadedState({required this.isAuth, required this.isFirstTime});
}

class OnBoardingSlideChangeState extends AuthenticationStates {
  final int slideIndex;
  OnBoardingSlideChangeState({required this.slideIndex});
}

class VisibilityButtonClickedState extends AuthenticationStates {}
