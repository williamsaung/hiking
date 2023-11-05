import 'package:hiking/src/models/export_models.dart';
import 'package:hiking/src/pages/chat/add_payment_slip_page.dart';
import 'package:hiking/src/pages/chat/check_payment_slip_page.dart';
import 'configs/export_config.dart';
import 'pages/export_pages.dart';
import 'package:flutter/material.dart';

class Routes {
  static const start = '/';
  static const register = '/register';
  static const login = '/login';
  static const bottomBarPages = '/bottomBarPages';
  static const profile = '/profile';
  static const map = '/map';
  static const favorite = '/favorite';
  static const history = '/history';
  static const chat = '/chat';
  static const emailVerification = '/emailVerification';
  static const phoneVerification = '/phoneVerification';
  static const completeProfile = '/completeProfile';
  static const myCampsite = '/myCampsite';
  static const addCampsiteForm = '/addCampsiteForm';
  static const addBankInfo = '/addBankInfo';
  static const addPaymentSlip = '/addPaymentSlip';
  static const checkPaymentSlip = '/checkPaymentSlip';
  static const addCardInfo = '/addCardInfo';
  static const campsiteDetails = '/campsiteDetails';
  static const bookCampsite = '/bookCampsite';

  static List<GetPage<dynamic>>? getAll() => _route;

  static final List<GetPage<dynamic>> _route = [
    GetPage(
      name: completeProfile,
      page: () => const CompleteProfilePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: phoneVerification,
      page: () => const PhoneVerificationPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: emailVerification,
      page: () => const EmailVerificationPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: bottomBarPages,
      page: () => BottomBarPages(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: addCampsiteForm,
      page: () => AddCampsiteFormPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: addCardInfo,
      page: () => AddPaymentFormPage(),
      transition: Transition.fadeIn,
    ),
  ];

  static Route<dynamic>? profilePageGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => profilePage());
  }

  static Route<dynamic>? myCampsitePageGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => MyCampsitePage());
  }

  static Route<dynamic>? chatPageGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case addBankInfo:
        Map<String, dynamic> arg = args as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => AddBankInfoPage(
                  bookingID: arg['bookingID'] as int,
                ));
      case checkPaymentSlip:
        Map<String, dynamic> arg = args as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => CheckPaymentSlipPage(
                  paymentSlip: arg['paymentSlip'] as String,
                  bookingID: arg['bookingID'] as int,
                ));
      case addPaymentSlip:
        Map<String, dynamic> arg = args as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => AddPaymentSlipPage(
                  bookingID: arg['bookingID'] as int,
                  bankName: arg['bankName'] as String,
                  bankNumber: arg['bankNumber'] as String,
                ));
    }
    return MaterialPageRoute(builder: (_) => NotificationPage());
  }

  static Route<dynamic>? mapPageGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const mapPage());
      case campsiteDetails:
        Map<String, dynamic> arg = args as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => CampsiteDetailsPage(
                  campsite: arg['result'] as Campsite,
                ));
      case bookCampsite:
        Map<String, dynamic> arg = args as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => BookCampsitePage(
                  campsite: arg['result'] as Campsite,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const mapPage());
    }
  }
}
