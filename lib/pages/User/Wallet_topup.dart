import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/addfunds_request_put.dart';
import 'package:minipro_mba/models/response/allerrorresponseget.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/EditProfile.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class WalletTopUpPage extends StatefulWidget {
  const WalletTopUpPage({super.key});

  @override
  State<WalletTopUpPage> createState() => _WalletTopUpPageState();
}

class _WalletTopUpPageState extends State<WalletTopUpPage> {
  TextEditingController inputnum = TextEditingController();
  final myWidget = MyWidget();
  final handleError = HandleError();

  @override
  Widget build(BuildContext context) {
    final userModel = context.read<Data>();
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'โปรไฟล์', // Profile in Thai
      ),
      body: Stack(children: [
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.2),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenSize.width * 0.32),
                  topRight: Radius.circular(screenSize.width * 0.32),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: screenSize.height * 0.12,
                child: Container(
                  width: screenSize.width * 0.7,
                  height: screenSize.height * 0.24,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 242, 247, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: screenSize.height * 0.12),
                    child: Align(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            userModel.datauser.name,
                            style: TextStyle(
                                fontFamily: 'MaliMedium',
                                fontSize: screenSize.width * 0.048,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: screenSize.height * 0.02),
                            child: SizedBox(
                              width: screenSize.width * 0.34,
                              height: screenSize.height * 0.05,
                              child: TextButton(
                                  onPressed: goEditProfile,
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all<
                                            Color>(
                                        const Color.fromRGBO(249, 85, 85, 1)),
                                  ),
                                  child: Text(
                                    "แก้ไขโปรไฟล์",
                                    style: TextStyle(
                                        fontFamily: 'MliMedium',
                                        fontSize: screenSize.width * 0.04,
                                        color: Colors.white),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenSize.height * 0.38,
                child: Container(
                  width: screenSize.width * 0.7,
                  height: screenSize.height * 0.4,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 59, 48, 0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: screenSize.height * 0.04),
                    child: Column(
                      children: [
                        Text(
                          "Wallet",
                          style: TextStyle(
                            fontFamily: 'MaliMedium',
                            fontSize: screenSize.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(top: screenSize.height * 0.02)),
                        Image.asset(
                          "assets/images/paywallet.png",
                          width: screenSize.width * 0.16,
                          height: screenSize.height * 0.09,
                        ),
                        Text(
                          "เติมเงินเข้าวอลเล็ท",
                          style: TextStyle(
                            fontFamily: 'MaliMedium',
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(top: screenSize.height * 0.01)),
                        Container(
                          margin: EdgeInsets.only(
                              left: screenSize.width * 0.06,
                              right: screenSize.width * 0.06),
                          child: TextField(
                            controller: inputnum,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled:
                                  true, // Ensures the background color is applied
                              fillColor: Colors
                                  .white, // Sets the background color to white
                              hintText:
                                  "กรุณากรอกจำนวนเงิน", // Placeholder text
                              hintStyle: TextStyle(
                                fontFamily: 'MaliMedium',
                                fontSize: screenSize.width * 0.035,
                                color: Colors
                                    .grey, // Optional: Color for placeholder text
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .black, // Sets the border color to black
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .black, // Sets the border color when the field is enabled
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(top: screenSize.height * 0.01)),
                        SizedBox(
                          width: screenSize.width * 0.37,
                          child: TextButton(
                              onPressed: addCost,
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    const Color.fromRGBO(255, 149, 0, 1)),
                              ),
                              child: Text(
                                "ยืนยันการเติมเงิน",
                                style: TextStyle(
                                    fontFamily: 'MaliMedium',
                                    fontSize: screenSize.width * 0.032,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Image.asset(
                  "assets/images/user-avatar.png",
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.24,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        )
      ]),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 4,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  Future<String> loadUrl() async {
    final value = await Configuration.getConfig();
    return value['apiEndpoint'];
  }

  void goEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditprofilePage()),
    );
  }

  Future<void> addCost() async {
    try {
      final url = await loadUrl();
      final member = context.read<Data>();

      int gratuity;
      try {
        gratuity = int.parse(inputnum.text);
      } catch (e) {
        // Handle the error, e.g., show a message to the user
        gratuity = 0; // or some default value
      }
      var body = AddfundsRequestPut(gratuity: gratuity);
      final jsonData = addfundsRequestPutToJson(body);

      var response = await http.put(
        Uri.parse('$url/wallet/AddFunds/${member.datauser.memberId}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonData,
      );

      if (response.statusCode == 200) {
        handleError.handleError(response);
        _topUpWallet(gratuity.toDouble());
      } else {
        handleError.handleError(response);
      }
    } catch (e) {
      myWidget.showCustomSnackbar("Message", 'An error occurred: $e');
    }
  }

  void _topUpWallet(double amount) {
    final dataModel = context.read<Data>();
    dataModel.updateWallet(dataModel.datauser.wallet + amount);
  }
}
