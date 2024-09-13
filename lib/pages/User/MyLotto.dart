import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/selectalllotto_request_get.dart';
import 'package:minipro_mba/models/response/getuserdrawnumbers_response_get.dart';
import 'package:minipro_mba/pages/User/ChooseLotto.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:http/http.dart' as http;
import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';

class MyLottoPage extends StatefulWidget {
  const MyLottoPage({super.key});

  @override
  State<MyLottoPage> createState() => _MyLottoPageState();
}

class _MyLottoPageState extends State<MyLottoPage> {
  bool isPressed = false;
  final myWidget = MyWidget();
  final handleError = HandleError();
  late Future<void> loadData;
  late List<GetuserdrawnumbersResponseGet> allLotto;

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'สลากของฉัน',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.1,
            vertical: screenSize.height * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "สลากที่ซื้อแล้ว",
                  style: TextStyle(
                      fontFamily: 'MaliMedium',
                      fontSize: screenSize.width * 0.055,
                      fontWeight: FontWeight.bold),
                ),
                FilledButton(
                    onPressed: goChooseLotto,
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(255, 34, 34, 1))),
                    child: Text(
                      "ซื้อเพิ่ม",
                      style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.034,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: screenSize.height * 0.003,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLottoButton(
                  context,
                  "เลขรอบปัจจุบัน",
                  !isPressed,
                  () {
                    setStateGenWinnerLotto(false);
                    loadData = loadDataAsync();
                  },
                ),
                buildLottoButton(
                  context,
                  "เลขที่เคยซื้อ",
                  isPressed,
                  () {
                    setStateGenWinnerLotto(true);
                    loadData = loadDataAsync();
                  },
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: screenSize.height * 0.003,
            ),
            FutureBuilder(
              future: loadData,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (allLotto.isEmpty) {
                  return const SizedBox.shrink();
                }

                return SingleChildScrollView(
                  child: Column(
                    children: allLotto
                        .map(
                          (lotto) => Card(
                            child: Padding(
                              // Added padding around the Card content
                              padding: EdgeInsets.all(screenSize.width * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: screenSize.width * 0.46,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenSize.width * 0.002,
                                          vertical: screenSize.height * 0.005,
                                        ),
                                        color: const Color.fromRGBO(
                                            217, 217, 217, 1),
                                        child: Center(
                                          child: Text(
                                            formatNumber(lotto.number),
                                            style: TextStyle(
                                              fontFamily: 'MaliMedium',
                                              fontSize:
                                                  screenSize.width * 0.046,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height * 0.026),
                                        child: Text(
                                          "งวดที่ ${lotto.period}",
                                          style: TextStyle(
                                            fontFamily: 'MaliMedium',
                                            fontSize: screenSize.width * 0.04,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${lotto.price} บาท",
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  Widget buildLottoButton(BuildContext context, String text, bool isActive,
      VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.38,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive
              ? const Color.fromRGBO(200, 30, 30, 1)
              : const Color.fromRGBO(255, 34, 34, 1),
          borderRadius: BorderRadius.circular(60),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(backgroundColor: Colors.transparent),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.034,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void setStateGenWinnerLotto(bool newState) {
    setState(() {
      isPressed = newState;
    });
  }

  void goChooseLotto() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ChooselottoPage()));
  }

  String formatNumber(String number) {
    return number.split('').join('   ');
  }

  Future<String> loadUrl() async {
    final value = await Configuration.getConfig();
    return value['apiEndpoint'];
  }

  Future<void> loadDataAsync() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));
      final url = await loadUrl();
      final member = context.read<Data>();
      var body = SelectalllottoRequestGet(status: isPressed);
      var jsonBody = selectalllottoRequestGetToJson(body);
      allLotto = [];

      final response = await http.post(
        Uri.parse(
            '$url/lottery/GetUserDrawNumbers/${member.datauser.memberId}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonBody,
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

        if (jsonResponse is Map<String, dynamic> || jsonResponse is String) {
          handleError.handleError(response);
        } else if (jsonResponse is List) {
          try {
            allLotto =
                getuserdrawnumbersResponseGetFromJson(jsonEncode(jsonResponse));
          } catch (e) {
            allLotto = [];
            myWidget.showCustomSnackbar(
                "Message", "Error parsing list of lotto data: $e");
          }
        }
      } else {
        allLotto = [];
        handleError.handleError(response);
      }
    } catch (e) {
      allLotto = [];
      myWidget.showCustomSnackbar("Message", 'An error occurred: $e');
    }
  }
}
