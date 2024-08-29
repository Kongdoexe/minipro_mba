import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:iconsax/iconsax.dart'; // Make sure you have this package installed

class Homepageuser extends StatefulWidget {
  final int mid;
  const Homepageuser({super.key, required this.mid});

  @override
  State<Homepageuser> createState() => _HomepageuserState();
}

class _HomepageuserState extends State<Homepageuser> {
  int _selectedIndex = 0; // Add this to keep track of the selected index

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'หน้าหลัก',
      ),
      body: Stack(
        children: [
          // Add other widgets here for the Stack if needed
          // Example placeholder for content:
          Center(child: Text("Content goes here")),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white, fontSize: screenSize.width * 0.034),
          ),
          iconTheme: MaterialStateProperty.all(
            IconThemeData(size: screenSize.width * 0.068),
          ),
        ),
        child: NavigationBar(
          backgroundColor: const Color.fromRGBO(249, 85, 85, 1),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
              // Handle navigation or state change based on index here
              // For example:
              // if (index == 0) {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              // }
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "หน้าแรก"),
            NavigationDestination(
                icon: Icon(Iconsax.wallet_check), label: "ตรวจสลาก"),
            NavigationDestination(
                icon: Icon(Iconsax.ticket), label: "สลากของฉัน"),
            NavigationDestination(
                icon: Icon(Iconsax.money_tick), label: "ซื้อสลาก"),
            NavigationDestination(
                icon: Icon(Iconsax.profile_2user), label: "โปรไฟล์"),
          ],
        ),
      ),
    );
  }
}
