import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final userModel = context.read<Data>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'โปรไฟล์',
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
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(
                              255, 255, 255, 255), // กำหนดสีของกล่อง
                          borderRadius: BorderRadius.circular(20), // ทำให้ขอบมน
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 300,
                              height: 220,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 100),
                                    child: Text(
                                      'ผู้ใช้คนที่1',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: 'MaliMedium',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(9.0),
                                    child: FilledButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 233, 119, 119),
                                        ),
                                        child: const Text(
                                          'แก้ไขโปรไฟล์',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'MaliMedium',
                                              fontWeight: FontWeight.w600),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                                255, 238, 213, 213), // กำหนดสีของกล่อง
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: 300,
                            height: 370,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Text(
                                    'Wallet',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontFamily: 'MaliMedium',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 235, 131,
                                          131), // กำหนดสีของกล่อง
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: SizedBox(
                                      width: 200,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/money-bag.png',
                                                    width: 30,
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20),
                                                    child: Text(
                                                      '฿ 100.00',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                          const Text(
                                            'ยอดเงินคงเหลือ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily: 'MaliMedium',
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/wallet.png',
                                            width: 50,
                                          ),
                                          SizedBox(height: 10,),
                                          const Text(
                                            'เติมเงินเข้าวอเล็ท',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily: 'MaliMedium',
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 550,
            right: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100), // กำหนดมุมโค้ง
              child: Image.network(
                'https://i.pinimg.com/564x/a8/0e/36/a80e3690318c08114011145fdcfa3ddb.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
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
}
