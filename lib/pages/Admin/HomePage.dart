import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/Admin/Admin_AppBar.dart';
import 'package:minipro_mba/pages/Admin/Admin_NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 191, 90),
      appBar: AdminAppBar(screenSize: screenSize, namePage: "ระบบล็อตโต้"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: screenSize.height * 0.02)),
            Image.asset(
              'assets/images/lotto.png',
              width: screenSize.width * 1,
              height: screenSize.height * 0.32,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.05,
                    vertical: screenSize.height * 0.04),
                child: SizedBox(
                  width: screenSize.width * 0.74,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "เงินทั้งหมดจากการขาย(บาท): ",
                            style: TextStyle(
                                fontFamily: 'MaliMedium',
                                fontSize: screenSize.width * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "XXXX",
                            style: TextStyle(
                                fontFamily: 'MaliMedium',
                                fontSize: screenSize.width * 0.038,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(255, 34, 34, 1)),
                          )
                        ],
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: screenSize.height * 0.018)),
                      Row(
                        children: [
                          Text(
                            "จำนวนลอตโต้ที่ขายได้(ใบ): ",
                            style: TextStyle(
                                fontFamily: 'MaliMedium',
                                fontSize: screenSize.width * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "XXXX",
                            style: TextStyle(
                                fontFamily: 'MaliMedium',
                                fontSize: screenSize.width * 0.038,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(255, 34, 34, 1)),
                          )
                        ],
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: screenSize.height * 0.018)),
                      Row(
                        children: [
                          Text("จำนวนลอตโต้ที่เหลือ(ใบ): ",
                              style: TextStyle(
                                  fontFamily: 'MaliMedium',
                                  fontSize: screenSize.width * 0.04,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            "XXXX",
                            style: TextStyle(
                                fontFamily: 'MaliMedium',
                                fontSize: screenSize.width * 0.038,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(255, 34, 34, 1)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: screenSize.height*0.01)),
            SizedBox(
              width: screenSize.width * 0.3,
              height: screenSize.height * 0.072,
              child: TextButton(
                  onPressed: resetLotto,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(199, 28, 16, 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "รีเซ็ทระบบ",
                      style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.034,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: screenSize.height*0.01)),
            SizedBox(
              width: screenSize.width * 0.3,
              height: screenSize.height * 0.072,
              child: TextButton(
                  onPressed: resetLotto,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(199, 28, 16, 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "เพิ่มลอตโต",
                      style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.034,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: Adminnavbar(
        selectedIndex: 0,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  resetLotto() {}
}
