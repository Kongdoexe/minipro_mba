import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/User/BuyLotto.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/PayLotto.dart';
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
    log(userModel.datauser.memberId.toString());

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'หน้าหลัก',

      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 227, 227),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenSize.width * 0.32),
                    topRight: Radius.circular(screenSize.width * 0.32),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'เลือกงวดรางวัลที่ออก',
                          style: TextStyle(
                              fontFamily: 'MaliMedium',
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius:
                                BorderRadius.circular(15), // กำหนดความมนของขอบ
                          ),
                          child: SizedBox(
                            width: 300,
                            height: 80,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'รอบที่1',
                                    style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Image.asset(
                                    'assets/images/calendar.png',
                                    width: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(
                                  30), // กำหนดความมนของขอบ
                            ),
                            child: SizedBox(
                              width: 300,
                              height: 470,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'รางวัลที่1',
                                      style: TextStyle(
                                          fontFamily: 'MaliMedium',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800,
                                          color:
                                              Color.fromRGBO(230, 77, 77, 1)),
                                    ),
                                  ),
                                  const Text(
                                    '1234123',
                                    style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize: 40,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                  const Text(
                                    'รางวัลละ xx',
                                    style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromRGBO(85, 83, 83, 1)),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 20, left: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'รางวัลที่2',
                                                style: TextStyle(
                                                    fontFamily: 'MaliMedium',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w800,
                                                    color: Color.fromRGBO(
                                                        230, 77, 77, 1)),
                                              ),
                                            ),
                                            Text(
                                              '1234123',
                                              style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1)),
                                            ),
                                            Text(
                                              'รางวัลละ xx',
                                              style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      85, 83, 83, 1)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'รางวัลที่3',
                                                style: TextStyle(
                                                    fontFamily: 'MaliMedium',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w800,
                                                    color: Color.fromRGBO(
                                                        230, 77, 77, 1)),
                                              ),
                                            ),
                                            Text(
                                              '1234123',
                                              style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1)),
                                            ),
                                            Text(
                                              'รางวัลละ xx',
                                              style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      85, 83, 83, 1)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        right: 20, left: 20, top: 40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'รางวัลที่4',
                                                style: TextStyle(
                                                    fontFamily: 'MaliMedium',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w800,
                                                    color: Color.fromRGBO(
                                                        230, 77, 77, 1)),
                                              ),
                                            ),
                                            Text(
                                              '1234123',
                                              style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1)),
                                            ),
                                            Text(
                                              'รางวัลละ xx',
                                              style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      85, 83, 83, 1)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'รางวัลที่5',
                                                style: TextStyle(
                                                    fontFamily: 'MaliMedium',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w800,
                                                    color: Color.fromRGBO(
                                                        230, 77, 77, 1)),
                                              ),
                                            ),
                                            Text(
                                              '1234123',
                                              style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1)),
                                            ),
                                            Text(
                                              'รางวัลละ xx',
                                              style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      85, 83, 83, 1)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 250,
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        FilledButton(
                                          onPressed: buylotto,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  30.0), // รูปทรงโค้งมนของปุ่ม
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30.0,
                                                vertical: 10.0),
                                            fixedSize: Size(120, 25),
                                          ),
                                          child: const Text(
                                            'ซื้อสลาก', // ข้อความบนปุ่ม
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'MaliMedium',
                                                fontSize:
                                                    12), // สีของข้อความบนปุ่ม
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
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  void buylotto() {
    final MemberID = context.read<Data>();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BuylottoPage(
                memberId: MemberID.datauser.memberId,
          )
      ),
    );
  }
}
