import 'package:flutter/material.dart';
import 'package:covid_19_tracer/text_field.dart';
import 'package:covid_19_tracer/services/auth.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/appicon.png',
                            width: 200, height: 200),
                      ],
                    ),
                    const Text(
                      'Welcome to Covid-19 Tracker !',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 71,
                    ),
                    CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      errorlabel: 'Email',
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      errorlabel: 'Password',
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: MaterialButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            authService
                                .login(emailController.text,
                                    passwordController.text)
                                .then((value) => {
                                      if (value is String)
                                        {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(content: Text(value)),
                                          )
                                        }
                                      else
                                        Navigator.pushNamed(context, '/third')
                                    });
                          }
                        },
                        elevation: 0,
                        minWidth: double.infinity,
                        height: 60,
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/fourth');
                        },
                        child: const Text("Forgot password?")),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Dont have an account?"),
                        const SizedBox(width: 0),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/second');
                            },
                            child: const Text("Register now!"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
