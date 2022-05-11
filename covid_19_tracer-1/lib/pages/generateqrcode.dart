import 'dart:typed_data';

import 'package:covid_19_tracer/model/vendor.dart';
// import 'package:covid_19_tracer/services/auth.dart'; 
import 'package:covid_19_tracer/services/vendor_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class GenerateQRPage extends StatefulWidget {
  final String arguments;
  const GenerateQRPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _GenerateQRPageState createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {
  final vendorkey = GlobalKey<FormState>();
  String data = '';

  final TextEditingController vendorNameController = TextEditingController();
  final TextEditingController vendorPhoneNumController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  // final TextEditingController address2Controller = TextEditingController();
  // final TextEditingController cityController = TextEditingController();
  // final TextEditingController stateController = TextEditingController();
  // final TextEditingController postCodeController = TextEditingController();
  ScreenshotController qrScreenShotController = ScreenshotController();

  Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Captured widget screenshot"),
        ),
        body: Center(
            child: capturedImage.isNotEmpty
                ? Image.memory(capturedImage)
                : Container()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);
    final vendorService = Provider.of<VendorServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD NEW VENDOR'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: vendorkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 220,
                  width: 220,
                  child: Screenshot(
                    controller: qrScreenShotController,
                    child: Column(
                      children: [
                        QrImage(
                            data: data,
                            embeddedImage:
                                const AssetImage('assets/appicon.png')),
                      ],
                    ),
                  ),
                ),
                Text("data: $data"),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: vendorNameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Vendor Name'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: vendorPhoneNumController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Vendor Phone Number'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: addressController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  'Enter Address ex*(street,city,state,postcode)'),
                        ),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(bottom: 20),
                      //   child: TextField(
                      //     controller: address2Controller,
                      //     decoration: const InputDecoration(
                      //         border: OutlineInputBorder(),
                      //         labelText: 'Enter Address 2'),
                      //   ),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.only(bottom: 20),
                      //   child: TextField(
                      //     controller: cityController,
                      //     decoration: const InputDecoration(
                      //         border: OutlineInputBorder(),
                      //         labelText: 'Enter City'),
                      //   ),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.only(bottom: 20),
                      //   child: TextField(
                      //     controller: stateController,
                      //     decoration: const InputDecoration(
                      //         border: OutlineInputBorder(),
                      //         labelText: 'Enter State'),
                      //   ),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.only(bottom: 20),
                      //   child: TextField(
                      //     controller: postCodeController,
                      //     decoration: const InputDecoration(
                      //         border: OutlineInputBorder(),
                      //         labelText: 'Enter Postcode'),
                      //   ),
                      // )
                    ],
                  ),
                ),
                MaterialButton(
                    onPressed: () {
                      Vendor vendor = Vendor(
                          name: vendorNameController.text,
                          address: addressController.text,
                          phonenum: vendorPhoneNumController.text,
                          userid: widget.arguments,
                          qrcode:
                              "https://firebasestorage.googleapis.com/v0/b/cobid-4c09f.appspot.com/o/qrcode%2Ffamilymart.svg?alt=media&token=dcbf29ab-ab54-44ae-8b3e-ee4bccc5490d");
                      vendorService
                          .add(vendor: vendor)
                          .then((value) => {setState(() => data = value.id)});
                      qrScreenShotController
                          .capture(delay: const Duration(milliseconds: 10))
                          .then((capturedImage) async {
                        showCapturedWidget(context, capturedImage!);
                      }).catchError((onError) {
                        if (kDebugMode) {
                          print(onError);
                        }
                      });
                    },
                    child: const Text('GENERATE QR')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
