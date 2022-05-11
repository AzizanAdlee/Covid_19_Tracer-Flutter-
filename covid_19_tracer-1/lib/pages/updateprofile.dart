import 'package:covid_19_tracer/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracer/text_field.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
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
                    'Update Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField(
                  controller: phonenoController,
                  label: 'Phone Number',
                  errorlabel: 'Phone Number',
                  label1: true,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField(
                  controller: addressController,
                  label: 'Address',
                  errorlabel: 'Address',
                  label1: true,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField(
                  controller: stateController,
                  label: 'State',
                  errorlabel: 'State',
                  label1: true,
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MaterialButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        authService.save(
                          phonenoController.text,
                          addressController.text,
                          stateController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Successfully Updated!')),
                        );
                        Navigator.pushNamed(context, '/third');
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
                      'Update',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
