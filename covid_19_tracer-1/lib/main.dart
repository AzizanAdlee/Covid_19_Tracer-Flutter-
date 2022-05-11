import 'package:covid_19_tracer/services/auth.dart';
import 'package:covid_19_tracer/services/vendor_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
// import 'pages/login.dart';
import 'package:covid_19_tracer/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController icController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(create: (_) => AuthService()),
          Provider<VendorServices>(create: (_) => VendorServices()),
        ],
        child: MaterialApp(
          title: 'Login',
          initialRoute:
              FirebaseAuth.instance.currentUser == null ? '/' : '/third',
          // routes: {
          //   '/': (context) => const Login(),
          //   '/second': (context) => const Register(),
          //   '/third': (context) => const Wrapper(),
          //   '/fourth': (context) => const ForgotPasswordPage(),
          //   '/fifth': (context) => const UpdateProfile(),
          //   '/seventh': (context) => const Vendor(),
          //   '/eighth': (context) => const GenerateQRPage(arguments:,)
          // },
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
