// import 'dart:ui';
// import 'package:covid_19_tracer/pages/login.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ForgotPasswordPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text.rich(TextSpan(
              text: 'Do you forgot your password?',
              style: TextStyle(fontSize: 40),
            )),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                errorText: 'Enter your email',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.mail,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: const Text('SUMBIT'),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const Text("Resend email",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue)),
                  //To Do
                  onTap: () => {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Widget okButton = TextButton(
  //   child: const Text("OK"),
  //   onPressed: () {
  //     const Login();
  //   },
  // );
}
