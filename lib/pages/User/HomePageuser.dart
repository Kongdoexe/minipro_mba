import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart'; // Make sure you have this package installed

class Homepageuser extends StatefulWidget {
  const Homepageuser({super.key});

  @override
  State<Homepageuser> createState() => _HomepageuserState();
}

class _HomepageuserState extends State<Homepageuser> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final userModel = context.read<Data>();

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
          Center(child: Text(userModel.datauser.memberId.toString())),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }
}
