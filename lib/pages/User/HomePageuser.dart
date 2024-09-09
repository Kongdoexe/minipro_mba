import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/User/ChooseLotto.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/PayLotto.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart'; // ตรวจสอบว่ามีการติดตั้ง package นี้แล้ว

class Homepageuser extends StatefulWidget {
  const Homepageuser({super.key});

  @override
  State<Homepageuser> createState() => _HomepageuserState();
}

class _HomepageuserState extends State<Homepageuser> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // กำหนดตัวแปร screenSize
    final userModel = context.read<Data>();
    String _text = '';


    log(userModel.datauser.memberId.toString());

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize, // ใช้ screenSize ที่กำหนดไว้
        namePage: 'หน้าหลัก',
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenSize.height * 0.25), // ใช้ screenSize
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 227, 227),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        screenSize.width * 0.32), // ใช้ screenSize
                    topRight: Radius.circular(
                        screenSize.width * 0.32), // ใช้ screenSize
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.05),
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  width: screenSize.width * 0.8, // ปรับขนาดตาม screenSize
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'เลือกงวดรางวัลที่ออก',
                        style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.04, // ใช้ screenSize
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(
                              screenSize.width * 0.04), // ใช้ screenSize
                        ),
                        child: SizedBox(
                          width: screenSize.width * 0.8, // ใช้ screenSize
                          height: screenSize.height * 0.1, // ใช้ screenSize
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    screenSize.width * 0.1), // ใช้ screenSize
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'รอบที่1',
                                  style: TextStyle(
                                    fontFamily: 'MaliMedium',
                                    fontSize: screenSize.width *
                                        0.07, // ใช้ screenSize
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                TextButton(
                                  onPressed: Select,
                                  child: Image.asset(
                                    'assets/images/calendar.png',
                                    width: screenSize.width *
                                        0.07, // ใช้ screenSize
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenSize.height * 0.03), // ใช้ screenSize
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(
                                screenSize.width * 0.08), // ใช้ screenSize
                          ),
                          child: SizedBox(
                            width: screenSize.width * 0.8, // ใช้ screenSize
                            height: screenSize.height * 0.56, // ใช้ screenSize
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screenSize.height *
                                          0.02), // ใช้ screenSize
                                  child: Text(
                                    'รางวัลที่1',
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width *
                                          0.06, // ใช้ screenSize
                                      fontWeight: FontWeight.w800,
                                      color:
                                          const Color.fromRGBO(230, 77, 77, 1),
                                    ),
                                  ),
                                ),
                                Text(
                                  '1234123',
                                  style: TextStyle(
                                    fontFamily: 'MaliMedium',
                                    fontSize: screenSize.width *
                                        0.07, // ใช้ screenSize
                                    fontWeight: FontWeight.w300,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                ),
                                Text(
                                  'รางวัลละ xx',
                                  style: TextStyle(
                                    fontFamily: 'MaliMedium',
                                    fontSize: screenSize.width *
                                        0.035, // ใช้ screenSize
                                    fontWeight: FontWeight.w300,
                                    color: const Color.fromRGBO(85, 83, 83, 1),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width *
                                        0.05, // ใช้ screenSize
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: screenSize.height *
                                                    0.02), // ใช้ screenSize
                                            child: Text(
                                              'รางวัลที่2',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.04, // ใช้ screenSize
                                                fontWeight: FontWeight.w800,
                                                color: const Color.fromRGBO(
                                                    230, 77, 77, 1),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '1234123',
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize: screenSize.width *
                                                  0.06, // ใช้ screenSize
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                            ),
                                          ),
                                          Text(
                                            'รางวัลละ xx',
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize: screenSize.width *
                                                  0.035, // ใช้ screenSize
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromRGBO(
                                                  85, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: screenSize.height *
                                                    0.02), // ใช้ screenSize
                                            child: Text(
                                              'รางวัลที่3',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.04, // ใช้ screenSize
                                                fontWeight: FontWeight.w800,
                                                color: const Color.fromRGBO(
                                                    230, 77, 77, 1),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '1234123',
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize: screenSize.width *
                                                  0.06, // ใช้ screenSize
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                            ),
                                          ),
                                          Text(
                                            'รางวัลละ xx',
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize: screenSize.width *
                                                  0.035, // ใช้ screenSize
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromRGBO(
                                                  85, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: screenSize.width * 0.05,
                                    left: screenSize.width * 0.05,
                                    top: screenSize.height * 0.04,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: screenSize.height *
                                                    0.02), // ใช้ screenSize
                                            child: Text(
                                              'รางวัลที่4',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.04, // ใช้ screenSize
                                                fontWeight: FontWeight.w800,
                                                color: const Color.fromRGBO(
                                                    230, 77, 77, 1),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '1234123',
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize: screenSize.width *
                                                  0.06, // ใช้ screenSize
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                            ),
                                          ),
                                          Text(
                                            'รางวัลละ xx',
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize: screenSize.width *
                                                  0.035, // ใช้ screenSize
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromRGBO(
                                                  85, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: screenSize.height *
                                                    0.02), // ใช้ screenSize
                                            child: Text(
                                              'รางวัลที่5',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.04, // ใช้ screenSize
                                                fontWeight: FontWeight.w800,
                                                color: const Color.fromRGBO(
                                                    230, 77, 77, 1),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '1234123',
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize: screenSize.width *
                                                  0.06, // ใช้ screenSize
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                            ),
                                          ),
                                          Text(
                                            'รางวัลละ xx',
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize: screenSize.width *
                                                  0.035, // ใช้ screenSize
                                              fontWeight: FontWeight.w300,
                                              color: const Color.fromRGBO(
                                                  85, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screenSize.height *
                                          0.04), // ใช้ screenSize
                                  child: Column(
                                    children: [
                                      Container(
                                        width: screenSize.width *
                                            0.7, // ใช้ screenSize
                                        height: 2,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: screenSize.height *
                                            0.02, // ใช้ screenSize
                                      ),
                                      FilledButton(
                                        onPressed: () => buylotto(context),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: screenSize.width *
                                                0.08, // ใช้ screenSize
                                            vertical: screenSize.height *
                                                0.015, // ใช้ screenSize
                                          ),
                                          fixedSize: Size(
                                            screenSize.width *
                                                0.4, // ใช้ screenSize
                                            screenSize.height *
                                                0.06, // ใช้ screenSize
                                          ),
                                        ),
                                        child: Text(
                                          'ซื้อสลาก',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'MaliMedium',
                                            fontWeight: FontWeight.w500,
                                            fontSize: screenSize.width *
                                                0.035, // ใช้ screenSize
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (value) {},
        screenSize: screenSize, // ใช้ screenSize
      ),
    );
  }

  void buylotto(BuildContext context) {
    final memberID = context.read<Data>();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooselottoPage(),
      ),
    );
  }

  void Select() {
    final member = context.read<Data>();
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 149, 0, 0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "รอบที่ ${member.period}", // ข้อความหัวเรื่อง
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // ปิด Dialog
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromRGBO(255, 34, 34, 1)),
                    ),
                    child: const Center(
                      child: Text(
                        'เลือก',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
