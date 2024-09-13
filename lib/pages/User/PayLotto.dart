import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/response/processpayment_response_with_lotto_deleted.dart';
import 'package:minipro_mba/models/response/regsiter_response_post.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class PaylottoPage extends StatefulWidget {
  int payResult;
  PaylottoPage({super.key, required this.payResult});

  @override
  State<PaylottoPage> createState() => _PaylottoPageState();
}

class _PaylottoPageState extends State<PaylottoPage> {
  late RegsiterResponsePost money;
  final myWidget = MyWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final dataProvider = context.read<Data>();
    final walletcheck = dataProvider.datauser.wallet;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(screenSize: screenSize, namePage: 'ตรวจสลาก'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Card(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text('ชำระเงิน',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: SizedBox(
                          width: 1000,
                          height: 120,
                          child: Card.outlined(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/paywallet.png',
                                    width: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text('ชำระเงินผ่านวอลเล็ท',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text('ยอดเงินคงเหลือ ',
                                              style: TextStyle(
                                                fontSize: 14,
                                              )),
                                          Text(
                                            walletcheck.toString(),
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 214, 65, 65),
                                              fontSize: 14,
                                            ),
                                          ),
                                          const Text(' บาท',
                                              style: TextStyle(
                                                fontSize: 14,
                                              )),
                                        ],
                                      ),
                                      FilledButton(
                                        onPressed: () => paylotto(),
                                        child: const Text(
                                          'ชำระเงิน',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color.fromARGB(
                                                      255, 240, 117, 29)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  Future<void> paylotto() async {
  final dataProvider = context.read<Data>();
  final memberId = dataProvider.datauser.memberId;

  var value = await Configuration.getConfig();
  var url = value['apiEndpoint'];

  try {
    final requestUrl = "$url/lottery/ProcessPayment/$memberId";
    log('Request URL: $requestUrl');

    var response = await http.put(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      log('Response: ${response.body}');

      var processResponse =
          processpaymentResponseWithLottoDeletedFromJson(response.body);

      log('LottoDeleted: ${processResponse.lottoDeleted}');
      log('Message: ${processResponse.msg}');

      if (processResponse.lottoDeleted.isNotEmpty) {
        // Show popup to inform user about deleted lotto numbers
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 245, 156, 55),
            title: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/warning.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const Text(
                    'รายการสลากบางรายการถูกซื้อไปแล้ว',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'รายการที่ถูกลบ:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...processResponse.lottoDeleted.map((number) => Text(number)),
              ],
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pop(); // Return to cart page
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 230, 92, 87)),
                ),
                child: const Center(
                    child: Text(
                  'รับทราบ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              )
            ],
          ),
        );
      } else {
        // Proceed with successful payment
        int updatedWalletBalance =
            dataProvider.datauser.wallet - widget.payResult;
        setState(() {
          dataProvider.datauser.wallet = updatedWalletBalance;
        });
        log(dataProvider.datauser.wallet.toString());

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 245, 156, 55),
            title: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/check.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const Text(
                    'ชำระเงินสำเร็จ',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 230, 92, 87)),
                ),
                child: const Center(
                    child: Text(
                  'ตกลง',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              )
            ],
          ),
        );
      }
    } else {
      log('Error: Status code ${response.statusCode}');
    }
  } catch (e) {
    log('Error: $e');
  }
}


  // โหลดหน้าตะกร้าใหม่
  // void reloadCart() {
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //     builder: (context) => const CartlottoPage(),
  //   ));
  // }

  // ลบพวกที่โดนซื้อแล้ว
  // void removeDeletedLotto(List<String> lottoDeleted) {
  //   final dataProvider = context.read<Data>();
  //   dataProvider.datauser.cartItems
  //       .removeWhere((item) => deletedNumbers.contains(item.lottoNumber));
  //   setState(() {});
  // }

  // แสดงกล่องข้อความสำเร็จ
  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 245, 156, 55),
        title: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/check.png',
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              const Text(
                'ชำระเงินสำเร็จ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30),
              ),
            ],
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิด Dialog
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 230, 92, 87)),
            ),
            child: const Center(
                child: Text(
              'ตกลง',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            )),
          )
        ],
      ),
    );
  }

// แสดงกล่องข้อความข้อผิดพลาด
  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 245, 156, 55),
        title: const Text(
          'ยอดเงินไม่พอ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: const Text(
          'โปรดเติมเงิน',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิด Dialog
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 230, 92, 87)),
            ),
            child: const Center(
                child: Text(
              'ตกลง',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            )),
          )
        ],
      ),
    );
  }
}
