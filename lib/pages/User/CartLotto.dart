import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/response/getnumbersincart_response_get.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/PayLotto.dart';
import 'package:http/http.dart' as http;
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart';

class CartlottoPage extends StatefulWidget {
  // int memberId = 0;
  // const CartlottoPage({super.key, required List<int> selectedTicketIds});

  final List<int> selectedTicketIds;
  int allPrice = 0;

  CartlottoPage(
      {Key? key, required this.selectedTicketIds, required this.allPrice})
      : super(key: key);

  @override
  State<CartlottoPage> createState() => _CartlottoPageState();
}

class _CartlottoPageState extends State<CartlottoPage> {
  late Future<void> loadData;
  late GetnumbersincartResponseGet lottoinCart; // Changed to a List

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'ตรวจสลาก',
        allPrice: 0,
      ),
      body: Stack(
        children: [
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
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  children: [
                    Text('สลาก ${widget.selectedTicketIds.length} ใบ',
                        style: const TextStyle(
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
                  child: FutureBuilder<void>(
                    future: loadData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (lottoinCart.data.isNotEmpty) {
                        return Column(
                          children: lottoinCart.data
                              .map((lottocart) => Card(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: choosemore,
                                                child: const Text(
                                                  'เลือกเลขเพิ่ม',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          221, 86, 76, 1)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 10, 30, 0),
                                              child: Column(
                                                children: [
                                                  Card.outlined(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child:
                                                                      SizedBox(
                                                                    width: 150,
                                                                    height: 50,
                                                                    child: Card(
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          186,
                                                                          186,
                                                                          186),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                              lottocart.numLotto),
                                                                          style:
                                                                              const TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child:
                                                                      OutlinedButton(
                                                                    onPressed:
                                                                        delete,
                                                                    child:
                                                                        const Text(
                                                                      'เอาออก',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    style: OutlinedButton
                                                                        .styleFrom(
                                                                      side: const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              240,
                                                                              8,
                                                                              8)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child: Text(
                                                                      '80 บาท'),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        );
                      } else {
                        return const Center(child: Text('No data available'));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Card.outlined(
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

  void choosemore() {}

  String formatNumber(String number) {
    return number.split('').join('  ');
  }

  Future<void> loadDataAsync(BuildContext context) async {
    final dataProvider = context.read<Data>();
    final memberId = dataProvider.datauser.memberId;

    var value = await Configuration.getConfig();
    var url = value['apiEndpoint'];

    try {
      final requestUrl = "$url/lottery/GetNumbersInCart/$memberId";
      log('Request URL: $requestUrl');

      var response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        log('Response: ${response.body}');
        lottoinCart = getnumbersincartResponseGetFromJson(response.body);
        log('LottoinCart: $lottoinCart');
      } else {
        log('Error: Status code ${response.statusCode}');
        lottoinCart = GetnumbersincartResponseGet(
            data: [], allprice: 0); // Initialize with an empty list
      }
    } catch (e) {
      log('Error: $e');
      lottoinCart = GetnumbersincartResponseGet(
          data: [], allprice: 0); // Initialize with an empty list
    }
  }

  void pay() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PaylottoPage(),
        ));
  }
}
