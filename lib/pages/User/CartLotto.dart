import 'dart:convert';
import 'dart:developer';
import 'package:minipro_mba/models/response/allerrorresponseget.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/removenumberfromcart_request_delete.dart';
import 'package:minipro_mba/models/response/getnumbersincart_response_get.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/PayLotto.dart';
import 'package:http/http.dart' as http;
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart';

class CartlottoPage extends StatefulWidget {
  final List<int> selectedTicketIds;

  CartlottoPage({
    Key? key,
    required this.selectedTicketIds,
  }) : super(key: key);

  @override
  State<CartlottoPage> createState() => _CartlottoPageState();
}

class _CartlottoPageState extends State<CartlottoPage> {
  late Future<void> loadData;
  late GetnumbersincartResponseGet lottoinCart;
  int totalPrice = 0;
  int totalData = 0;
  int period = 0;
  final myWidget = MyWidget();

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
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'ตรวจสอบรายการสลาก',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: [
                Text(
                  'สลาก $totalData ใบ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenSize.width * 0.03),
            child: Row(
              children: [
                Text(
                  'งวดที่ $period',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: screenSize.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: choosemore,
                          child: const Text(
                            'เลือกเลขเพิ่ม',
                            style: TextStyle(
                                color: Color.fromRGBO(221, 86, 76, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<void>(
                      future: loadData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (lottoinCart.data.isNotEmpty) {
                          return ListView.builder(
                            itemCount: lottoinCart.data.length,
                            itemBuilder: (context, index) {
                              final lottocart = lottoinCart.data[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width * 0.08,
                                    vertical: screenSize.height * 0.01),
                                child: Card.outlined(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        screenSize.width * 0.01,
                                                    vertical:
                                                        screenSize.height *
                                                            0.01),
                                                child: SizedBox(
                                                  width:
                                                      screenSize.width * 0.46,
                                                  height:
                                                      screenSize.height * 0.06,
                                                  child: Card(
                                                    color: const Color.fromARGB(
                                                        255, 186, 186, 186),
                                                    child: Center(
                                                      child: Text(
                                                        formatNumber(
                                                            lottocart.numLotto),
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Text('งวดที่'),
                                              Text(lottocart.lottoData.period
                                                  .toString()),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: OutlinedButton(
                                                  onPressed: () => daleteDialog(
                                                      lottocart.cartId),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: const BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 240, 8, 8)),
                                                  ),
                                                  child: const Text(
                                                    'เอาออก',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(lottocart
                                                    .lottoData.price
                                                    .toString()),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('No data available'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width,
            child: Card(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.005),
                child: Column(
                  children: [
                    const Text(
                      'ยอดชำระทั้งหมด',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$totalPrice บาท',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    SizedBox(
                      width: screenSize.width * 0.3,
                      child: ElevatedButton(
                        onPressed: pay,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 85, 85, 1),
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.01),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text(
                          'ชำระเงิน',
                          style: TextStyle(color: Colors.white),
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
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  void delete(int cartId) async {
    try {
      final dataProvider = context.read<Data>();
      final memberId = dataProvider.datauser.memberId;

      var value = await Configuration.getConfig();
      var url = value['apiEndpoint'];
      RemovenumberfromcartRequestDelete body =
          RemovenumberfromcartRequestDelete(cartId: cartId, memberId: memberId);
      var jsonData = removenumberfromcartRequestDeleteToJson(body);
      var requestUrl = await http.delete(
          Uri.parse('$url/lottery/RemoveNumberFromCart'),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: jsonData);

      if (requestUrl.statusCode == 200) {
        log('Response: ${requestUrl.body}');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/check.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const Text(
                    'เอาออกสำเร็จ',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'ปิด',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        await loadDataAsync(context);
      } else {
        log('Error: Status code ${requestUrl.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  void choosemore() {
    Navigator.pop(context);
  }

  String formatNumber(String number) {
    return number.split('').join('  ');
  }

  Future<void> loadDataAsync(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
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
        setState(() {
          lottoinCart = getnumbersincartResponseGetFromJson(response.body);
          totalPrice = lottoinCart.allprice;
          totalData = lottoinCart.data.length;
          period = dataProvider.period;
        });
        log('LottoinCart: $lottoinCart');
      } else {
        log('Error: Status code ${response.statusCode}');
        setState(() {
          lottoinCart = GetnumbersincartResponseGet(data: [], allprice: 0);
          totalPrice = 0;
          totalData = 0;
          period = 0;
        });
      }
    } catch (e) {
      log('Error: $e');
      setState(() {
        lottoinCart = GetnumbersincartResponseGet(data: [], allprice: 0);
        totalPrice = 0;
        totalData = 0;
        period = 0;
      });
    }
  }

  void pay() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  PaylottoPage(payResult: totalPrice,),
      ),
    );
  }

  void _handleError(http.Response response) {
    final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    if (jsonResponse is Map<String, dynamic>) {
      final msgValue = jsonResponse['msg'];
      if (msgValue is String) {
        myWidget.showCustomSnackbar('Message', msgValue);
      } else if (msgValue is Map<String, dynamic>) {
        try {
          final msg = allerrorresponsegetFromJson(jsonEncode(msgValue));
          myWidget.showCustomSnackbar('Message', msg.toString());
        } catch (e) {
          myWidget.showCustomSnackbar('Message', 'Error parsing "msg": $e');
        }
      }
    } else {
      myWidget.showCustomSnackbar('Error', 'Unexpected response format');
    }
  }

  void daleteDialog(int cartId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Center(
          child: Column(
            children: [
              Text(
                'ยืนยันการเอา',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: 30),
              ),
              Text(
                'เลขออก',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: 30),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิด Dialog
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 102, 102, 102)),
                ),
                child: const Center(
                    child: Text(
                  'ปิด',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  delete(cartId); // ปิด Dialog
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 206, 52, 52)),
                ),
                child: const Center(
                    child: Text(
                  'ลบ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
