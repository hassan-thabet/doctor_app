import 'package:doctor_app/modules/authentication/cubit/authentication_cubit.dart';
import 'package:doctor_app/modules/authentication/screens/login_screen.dart';
import 'package:doctor_app/modules/authentication/screens/onboarding_screen.dart';
import 'package:doctor_app/modules/authentication/screens/register_screen.dart';
import 'package:doctor_app/modules/authentication/screens/signup_screen.dart';
import 'package:doctor_app/modules/authentication/screens/splash_screen.dart';
import 'package:doctor_app/modules/favorites/screens/favorites_screen.dart';
import 'package:doctor_app/modules/home/bloc/main_cubit.dart';
import 'package:doctor_app/modules/home/view/main_screen.dart';
import 'package:doctor_app/modules/notifications/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarIconBrightness:
        Brightness.dark // Dark == white status bar -- for IOS.
    )
    );
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationCubit()..startSplashPage()),
          BlocProvider(create: (context) => MainCubit()),
        ],

        child: MaterialApp(
          title: 'Doctor App',
          // home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/onboarding_screen': (context) => const OnBoardingScreen(),
            '/login_screen': (context) => const LoginScreen(),
            '/register_screen': (context) => const RegisterScreen(),
            '/signup_screen': (context) => const SignupScreen(),
            '/main_screen': (context) => const MainScreen(),
            '/notifications_screen': (context) => const NotificationsScreen(),
            '/favorites_screen': (context) => const FavoritesScreen(),

          },
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: Colors.black87,
                fontSize: 24,
              ),
              titleSmall: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),

            appBarTheme: const AppBarTheme(

              elevation: 0,
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black87 , fontSize: 18),
              iconTheme: IconThemeData(
                color: Colors.black87
              )
            )
          ),

        )
    );
  }
}
