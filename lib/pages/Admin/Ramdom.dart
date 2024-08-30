import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/Admin/Admin_AppBar.dart';
import 'package:minipro_mba/pages/Admin/Admin_NavBar.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 191, 90),
      appBar: AdminAppBar(screenSize: screenSize, namePage: "สุ่มออกรางวัล"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.08,
          vertical: screenSize.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "เลือกวิธีออกรางวัล",
              style: TextStyle(
                fontFamily: 'MaliMedium',
                fontSize: screenSize.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: screenSize.height * 0.01)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLottoButton(
                  context,
                  "ลอตโต้ที่ขายไปแล้ว",
                  isPressed == false,
                  () => setStateGenWinnerLotto(false),
                ),
                buildLottoButton(
                  context,
                  "ลอตโต้ทั้งหมด",
                  isPressed == true,
                  () => setStateGenWinnerLotto(true),
                ),
              ],
            ),
            Divider(
              color: const Color.fromARGB(255, 255, 255, 255),
              thickness: screenSize.height * 0.003,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenSize.height * 0.01,
                  left: screenSize.width * 0.04,
                  right: screenSize.width * 0.04),
              child: Column(
                children: [
                  Text("data")
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Adminnavbar(
        selectedIndex: 1,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  Widget buildLottoButton(BuildContext context, String text, bool isActive,
      VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.4,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive
              ? const Color.fromRGBO(200, 30, 30, 1)
              : const Color.fromRGBO(255, 34, 34, 1),
          borderRadius: BorderRadius.circular(60),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.034,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void setStateGenWinnerLotto(bool newState) {
    setState(() {
      if (isPressed != newState) {
        isPressed = newState;
      }
    });
  }
}
