import 'package:chat_app/constants/routes/app_routes.dart';
import 'package:chat_app/views/authentication/Signin_screen.dart';
import 'package:chat_app/views/authentication/sign_up.dart';
import 'package:chat_app/views/onbaording/onbaording_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.onBoardingScreen,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.signUpSucess,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => SigninScreen(),
    ),
  ];
}
