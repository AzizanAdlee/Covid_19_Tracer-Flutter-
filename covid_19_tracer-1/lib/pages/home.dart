import 'package:covid_19_tracer/kotak.dart';
import 'package:covid_19_tracer/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/icon.svg',
                          semanticsLabel: 'logo', width: 30, height: 40),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 251, 217, 229),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(30, 0, 0, 0),
                            blurRadius: 12.0,
                            spreadRadius: 0,
                            offset: Offset(0, 6))
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medication_outlined,
                          size: 45.0,
                          color: Colors.grey[700],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Fully Vaccinated',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        user.vaccination!.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Completed 2nd dose on ' +
                                      '${user.vaccination![1].toDate()}'
                                          .split(" ")[0],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              )
                            : Container(),
                        Container(
                          width: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 239, 174, 197),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  user.ic,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  user.email,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])),
              const SizedBox(
                height: 29,
              ),
              const Kotak(
                icon: Icons.coronavirus,
                title: 'Covid-19 Status',
                subtitle: 'Low Risk',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Text(
                  'History',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ]),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Recent place visited',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ])),
              const Kotak(
                icon: Icons.local_gas_station,
                title: 'Petronas Season Garden',
                subtitle: '28th July 2021',
              ),
              const SizedBox(
                height: 20,
              ),
              const Kotak(
                  title: 'Ayam Gepuk Pak Gembus',
                  subtitle: '30 March 2020',
                  icon: Icons.restaurant),
              const SizedBox(
                height: 20,
              ),
              const Kotak(
                  title: 'Uniqlo',
                  subtitle: '4th April 2020',
                  icon: Icons.store_outlined),
            ]));
  }
}
