import 'package:covid_19_tracer/model/user.dart';
import 'package:covid_19_tracer/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracer/text_field.dart';
import 'package:provider/provider.dart';

class Vendor extends StatefulWidget {
  const Vendor({Key? key}) : super(key: key);

  @override
  _VendorState createState() => _VendorState();
}

class _VendorState extends State<Vendor> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();
  TextEditingController qrcodeController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 70),
              child: Text('Add a vendor'),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 111, 153, 255),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            StreamBuilder<Object>(
                stream: authService.userr,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  User user = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        width: 350,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Icon(
                                  Icons.person_sharp,
                                  size: 60.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(user.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700])),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(user.ic,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700])),
                                  ],
                                ),
                              ),
                            ]),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 251, 217, 229),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(30, 0, 0, 0),
                                  blurRadius: 12.0,
                                  spreadRadius: 0,
                                  offset: Offset(0, 6))
                            ])),
                  );
                }),
            const SizedBox(
              height: 40,
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
              controller: addressController,
              label: 'Address',
              errorlabel: 'Address',
            ),
            const SizedBox(
              height: 35,
            ),
            CustomTextField(
              controller: phonenumController,
              label: 'Contact No',
              errorlabel: 'Contact No',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 180, horizontal: 27),
              child: MaterialButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    authService
                        .vendorr(nameController.text, addressController.text,
                            phonenumController.text, qrcodeController.text)
                        .then((value) => {
                              if (value is String)
                                {
                                  // login
                                  ScaffoldMessenger.of(context).showSnackBar(
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
          ],
        ),
      ),
    );
  }
}
