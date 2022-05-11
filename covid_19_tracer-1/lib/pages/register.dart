import 'package:covid_19_tracer/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracer/text_field.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController icController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  bool isObscure = true;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/appicon.png', width: 200, height: 200),
                  ],
                ),
                const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 71,
                ),
                CustomTextField(
                  controller: nameController,
                  label: 'Name',
                  errorlabel: 'Name',
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField(
                  controller: icController,
                  label: 'NRIC',
                  errorlabel: 'IC',
                ),
                const SizedBox(
                  height: 35,
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
                  controller: phonenoController,
                  label: 'Phone Number',
                  errorlabel: 'Phone Number',
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField(
                  controller: addressController,
                  label: 'Address',
                  errorlabel: 'Address',
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField(
                  controller: stateController,
                  label: 'State',
                  errorlabel: 'State',
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: isObscure,
                    validator: (val) =>
                        val!.isNotEmpty ? null : 'Please enter password',
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      contentPadding: const EdgeInsets.all(10),
                      // prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      labelText: 'Password',
                    ),
                  ),
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
                            .register(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                                phonenoController.text,
                                icController.text,
                                addressController.text,
                                stateController.text)
                            .then((value) => {
                                  if (value is String)
                                    {
                                      // login
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text(value)),
                                      )
                                    }

                                  // profile
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
                      'Submit',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 0),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Login now!"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
