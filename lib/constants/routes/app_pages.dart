import 'package:chat_app/constants/routes/app_routes.dart';
import 'package:chat_app/views/authentication/Signin_screen.dart';
import 'package:chat_app/views/authentication/email_sucess.dart';
import 'package:chat_app/views/authentication/forgot_password.dart';
import 'package:chat_app/views/authentication/sign_up.dart';
import 'package:chat_app/views/main/chat_page.dart';
import 'package:chat_app/views/main/events_page.dart';
import 'package:chat_app/views/main/leaderboard_page.dart';
import 'package:chat_app/views/main/main_screen.dart';
import 'package:chat_app/views/main/profile_page.dart';
import 'package:chat_app/views/main/rooms_page.dart';
import 'package:chat_app/views/main/subscription_page.dart';
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
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPassword(),
    ),
    GetPage(
      name: AppRoutes.emailSucess,
      page: () => EmailSucess(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => MainScreen(),
    ),
    GetPage(
      name: AppRoutes.profilePage,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: AppRoutes.subscriptionPage,
      page: () => SubscriptionPage(),
    ),
    GetPage(
      name: AppRoutes.leaderboardPage,
      page: () => LeaderboardPage(),
    ),
    GetPage(
      name: AppRoutes.roomPage,
      page: () => RoomsPage(),
    ),
    GetPage(
      name: AppRoutes.chatPage,
      page: () => ChatPage(),
    ),
    GetPage(
      name: AppRoutes.eventPage,
      page: () => EventsPage(),
    ),
  ];
}
