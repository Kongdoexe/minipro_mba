import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/pages/User/CartLotto.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';

class BuylottoPage extends StatefulWidget {
  const BuylottoPage({super.key});
  @override
  State<BuylottoPage> createState() => _BuylottoPageState();
}

class _BuylottoPageState extends State<BuylottoPage> {
  int selectedItems = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(screenSize: screenSize, namePage: 'ซื้อสลาก',),
      body: Container(
          child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('ค้นหาเลขเด็ด',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('งวดวันที่ 1 กันยายน 2567'),
                      ),
                      const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilledButton(
                              onPressed: search,
                              child: const Text('ค้นหาเลข'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(230, 92, 87, 1)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  //const Icon(Icons.shopping_cart), // ไอคอนรถเข็น
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                        30, 5, 30, 10), // ระยะห่างระหว่าง card กับเส้น
                    height: 2.0, // ความหนาของเส้น
                    color: Colors.black, // สีของเส้น
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('เลขที่ยังไม่ถูกขาย',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: 
                    // FutureBuilder(
                    //   future: loadData, 
                    //   builder: (context, snapshot ))
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 150, // กำหนดความกว้างของ Card
                                        height: 50, // กำหนดความสูงของ Card
                                        child: Card(
                                          color: Color.fromARGB(
                                              255, 186, 186, 186),
                                          child: Center(
                                              child: Text(
                                            '123456',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: OutlinedButton(
                                      onPressed: choose,
                                      child: const Text('เลือก',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: Color.fromARGB(255, 231, 84,
                                                81)), // กำหนดสีขอบ
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('80 บาท'),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  //   child: Card(
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const Column(
                  //               children: [
                  //                 Padding(
                  //                     padding: EdgeInsets.all(8.0),
                  //                     child: SizedBox(
                  //                       width: 150, // กำหนดความกว้างของ Card
                  //                       height: 50, // กำหนดความสูงของ Card
                  //                       child: Card(
                  //                         color: Color.fromARGB(255, 186, 186, 186),
                  //                         child: Center(
                  //                             child: Text(
                  //                           '123456',
                  //                           style: TextStyle(
                  //                               color: Colors.black,
                  //                               fontSize: 20,
                  //                               fontWeight: FontWeight.bold),
                  //                         )),
                  //                       ),
                  //                     )),
                  //                 Text('งวดที่'),
                  //                 Text('64'),
                  //               ],
                  //             ),
                  //             Column(
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: OutlinedButton(
                  //                     onPressed: choose,
                  //                     child: const Text('เลือก'),
                  //                     style: OutlinedButton.styleFrom(
                  //                       side: const BorderSide(
                  //                           color: Color.fromARGB(255, 231, 84, 81)), // กำหนดสีขอบ
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 const Padding(
                  //                   padding: EdgeInsets.all(8.0),
                  //                   child: Text('80 บาท'),
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  //   child: Card(
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const Column(
                  //               children: [
                  //                 Padding(
                  //                     padding: EdgeInsets.all(8.0),
                  //                     child: SizedBox(
                  //                       width: 150, // กำหนดความกว้างของ Card
                  //                       height: 50, // กำหนดความสูงของ Card
                  //                       child: Card(
                  //                         color: Color.fromARGB(255, 186, 186, 186),
                  //                         child: Center(
                  //                             child: Text(
                  //                           '123456',
                  //                           style: TextStyle(
                  //                               color: Colors.black,
                  //                               fontSize: 20,
                  //                               fontWeight: FontWeight.bold),
                  //                         )),
                  //                       ),
                  //                     )),
                  //                 Text('งวดที่'),
                  //                 Text('64'),
                  //               ],
                  //             ),
                  //             Column(
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: OutlinedButton(
                  //                     onPressed: choose,
                  //                     child: const Text('เลือก'),
                  //                     style: OutlinedButton.styleFrom(
                  //                       side: const BorderSide(
                  //                           color: Color.fromARGB(255, 231, 84, 81)), // กำหนดสีขอบ
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 const Padding(
                  //                   padding: EdgeInsets.all(8.0),
                  //                   child: Text('80 บาท'),
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          if (selectedItems > 0) ...[
            //ตรวจสอบการเลือกสลาก
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('สลากที่เลือก $selectedItems ใบ'),
                      ElevatedButton(
                        onPressed: check,
                        child: const Text(
                          'ตรวจสอบสลากของคุณ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 231, 84, 81),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      )),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  void search() {}

  void choose() {
    setState(() {
      selectedItems++;
    });
  }

  void check() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartlottoPage(),
        ));
  }
}
