import 'package:covid_19_tracer/pages/forgotpassword.dart';
import 'package:covid_19_tracer/pages/generateqrcode.dart';
import 'package:covid_19_tracer/pages/updateprofile.dart';
import 'package:covid_19_tracer/pages/vendor.dart';
import 'package:covid_19_tracer/pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracer/pages/login.dart';
import 'pages/register.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/second':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/third':
        return MaterialPageRoute(builder: (_) => const Wrapper());
      case '/fourth':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case '/fifth':
        return MaterialPageRoute(builder: (_) => const UpdateProfile());
      case '/seventh':
        return MaterialPageRoute(builder: (_) => const Vendor());
      case '/eighth':
        return MaterialPageRoute(
            builder: (_) =>
                GenerateQRPage(arguments: settings.arguments.toString()));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
