import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/response/regsiter_response_post.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PaylottoPage extends StatefulWidget {
  const PaylottoPage({super.key});

  @override
  State<PaylottoPage> createState() => _PaylottoPageState();
}

class _PaylottoPageState extends State<PaylottoPage> {

  late RegsiterResponsePost money ;

  final myWidget = MyWidget();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var wallet_check = context.read<Data>();
    
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
                          child: 
                          Card.outlined(
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
                                          Text(wallet_check.datauser.wallet.toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                              )),
                                          const Text(
                                            ' 100 ',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 214, 65, 65),
                                              fontSize: 14,
                                            ),
                                          ),
                                          const Text('บาท',
                                              style: TextStyle(
                                                fontSize: 14,
                                              )),
                                        ],
                                      ),
                                      FilledButton(
                                        onPressed: paylotto,
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

  void paylotto() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text('สำเร็จ'),
          content: const Text('การชำระเงินของคุณสำเร็จแล้ว'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  // Future<void> loadDataAsync() async {
  //   final dataProvider = context.read<Data>();
  //   final memberId = dataProvider.datauser.memberId;

  //   var value = await Configuration.getConfig();
  //   var url = value['apiEndpoint'];

  //   try {
  //     final requestUrl = "$url/lottery/GetNumbersInCart/$memberId";
  //     log('Request URL: $requestUrl');

  //     var response = await http.get(Uri.parse(requestUrl));

  //     if (response.statusCode == 200) {
  //       log('Response: ${response.body}');
  //       setState(() {
          
  //       });
  //       log('LottoinCart: ');
  //     } else {
  //       log('Error: Status code ${response.statusCode}');
  //       setState(() {
         
  //       }); // Initialize with an empty list
  //     }
  //   } catch (e) {
  //     log('Error: $e');
  //     setState(() {
        
  //     }); // Initialize with an empty list
  //   }
  // }
}
