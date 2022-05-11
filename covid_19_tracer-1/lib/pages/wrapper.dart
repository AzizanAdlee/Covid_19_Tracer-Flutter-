import 'package:covid_19_tracer/model/user.dart';
import 'package:covid_19_tracer/pages/home.dart';
import 'package:covid_19_tracer/pages/profile.dart';
import 'package:covid_19_tracer/pages/scanqr.dart';
import 'package:covid_19_tracer/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _selectedIndex = 0;
  Widget optionSelected(
      {required int index, required User data, int? userType}) {
    switch (index) {
      case 0:
        return Home(
          user: data,
        );
      case 1:
        return const QRViewExample();
      default:
        return Profile(user: data);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: StreamBuilder<User>(
          stream: authService.userr,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            User user = snapshot.data;
            return optionSelected(index: _selectedIndex, data: user);
          }),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_sharp),
            label: 'qrscan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
