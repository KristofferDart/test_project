import 'package:flutter/material.dart';
import 'package:test_project/features/otp/otp_view.dart';

import '../features/otp/otp_initial_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OtpView.route:
        return MaterialPageRoute<dynamic>(builder: (_) => const OtpView());

      case OtpInitialView.route:
        return MaterialPageRoute<dynamic>(builder: (_) => const OtpInitialView());

      default:
        return MaterialPageRoute<dynamic>(builder: (_) {
          return Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          );
        });
    }
  }
}
