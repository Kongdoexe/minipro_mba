import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/PayLotto.dart';
import 'package:http/http.dart' as http;

class CartlottoPage extends StatefulWidget {
  // int memberId = 0;
  const CartlottoPage({super.key});

  @override
  State<CartlottoPage> createState() => _CartlottoPageState();
}

class _CartlottoPageState extends State<CartlottoPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(screenSize: screenSize, namePage: 'ตรวจสลาก',),
      body: Stack(
        children: [
          // Main content
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ตรวจสอบรายการสลาก',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  children: [
                    Text('สลาก 1 ใบ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text('งวดวันที่ 1 กันยายน 2567'),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: screenSize.width,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: choosemore,
                                  child: const Text(
                                    'เลือกเลขเพิ่ม',
                                    style: TextStyle(
                                        color: Color.fromRGBO(221, 86, 76, 1)),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                child: Column(
                                  children: [
                                    Card.outlined(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: SizedBox(
                                                        width:
                                                            150, // Card width
                                                        height:
                                                            50, // Card height
                                                        child: Card(
                                                          color: Color.fromARGB(
                                                              255,
                                                              186,
                                                              186,
                                                              186),
                                                          child: Center(
                                                              child: Text(
                                                            '123456',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ),
                                                      )),
                                                  Text('งวดที่'),
                                                  Text('64'),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: OutlinedButton(
                                                      onPressed: delete,
                                                      child: Text('เอาออก',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        side: const BorderSide(
                                                            color: Color.fromARGB(
                                                                255,
                                                                240,
                                                                8,
                                                                8)), // Border color
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text('80 บาท'),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
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
                  ),
                ),
              ),
            ],
          ),

          // Positioned card over the navigation bar
          Positioned(
            bottom: 0, // Adjust as needed
            left: 0,
            right: 0,
            child: Card.outlined(
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    const Text(
                      'ยอดชำระทั้งหมด',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '80 บาท',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: pay,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 85, 85, 1),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text(
                          'ชำระเงิน',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  void delete() async {
    // var config = await Configuration.getConfig();
    // var url = config['apiEndpoint'];
    // try {
    //   var res = await http.delete(Uri.parse('$url/lottery/RemoveNumberFromCart${widget.memberidx}'));
    //   log(res.statusCode.toString());
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: const Text('สำเร็จ'),
    //       content: const Text('ลบ lotto เรียบร้อย'),
    //       actions: [
    //         FilledButton(
    //             onPressed: () { 
    //               Navigator.popUntil(
    //                 context,
    //                 (route) => route.isFirst,
    //               );
    //             },
    //             child: const Text('ปิด'))
    //       ],
    //     ),
    //   );
    // } catch (err) {}
  }

  void choosemore() {
  }

  void pay() {
     Navigator.push(context,
    MaterialPageRoute(builder: (context) => const PaylottoPage(),
    ));
  }
}
