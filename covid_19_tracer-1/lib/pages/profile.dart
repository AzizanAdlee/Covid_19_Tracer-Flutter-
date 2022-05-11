import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_tracer/kotak.dart';
import 'package:covid_19_tracer/model/user.dart';
import 'package:covid_19_tracer/model/vaccination.dart';
import 'package:covid_19_tracer/model/vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:covid_19_tracer/services/auth.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final authService = Provider.of<AuthService>(context);
    return ListView(children: [
      Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Profile',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/icon.svg',
                        semanticsLabel: 'logo', width: 30, height: 60),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 199, 213, 247),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(30, 0, 0, 0),
                          blurRadius: 12.0,
                          spreadRadius: 0,
                          offset: Offset(0, 6))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              leading: Icon(Icons.person_sharp,
                                  size: 50.0, color: Colors.grey[600]),
                              title: Text(user.name),
                              subtitle: Text(user.ic),
                              trailing: IconButton(
                                  icon: const Icon(Icons.settings_outlined,
                                      size: 30),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/eighth',
                                        arguments: user.uid);
                                  })),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Phone Number'),
                                Text(user.phonenum),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Address'),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    user.address,
                                    maxLines: 3,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('State'),
                                Text(user.state),
                              ],
                            ),
                          ),
                        ]))),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: authService.isvendor,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: snapshot.data!.docs.isNotEmpty
                        ? [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: const [
                                  Text(
                                    'Vendor Info',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            ...snapshot.data!.docs.map((DocumentSnapshot e) {
                              Vendor vendor = Vendor.fromFirestore(e);
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: KotakHati(
                                    title: vendor.name,
                                    subtitle: vendor.address,
                                    phonenum: vendor.phonenum,
                                    qrcode: vendor.qrcode),
                              );
                            })
                          ]
                        : [],
                  );
                }),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: const [
                  Text(
                    'Vaccination Certificate',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: authService.vaccination,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      ...snapshot.data!.docs.map((DocumentSnapshot e) {
                        Vaccination vaccination = Vaccination.fromFirestore(e);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: KotakHati1(
                              name: user.name,
                              ic: user.ic,
                              manufacterer: vaccination.manufacterer,
                              batch: vaccination.batch,
                              location: vaccination.location,
                              qrcode: vaccination.qrcode),
                        );
                      })
                    ],
                  );
                }),
          ])),
    ]);
  }
}
