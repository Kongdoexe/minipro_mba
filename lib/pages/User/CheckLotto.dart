import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/getwinningnumbers_request_get.dart';
import 'package:minipro_mba/models/response/getuserdrawnumbers_response_get.dart';
import 'package:minipro_mba/models/response/getwinningnumbers_response_get.dart';
import 'package:minipro_mba/models/response/response_handler.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/ResultLotto.dart';
import 'package:minipro_mba/share/Data.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CheckLottoPage extends StatefulWidget {
  const CheckLottoPage({super.key});

  @override
  State<CheckLottoPage> createState() => _CheckLottoPageState();
}

class _CheckLottoPageState extends State<CheckLottoPage> {
  TextEditingController test = TextEditingController(text: "รอบที่ 1");
  late Future<void> loadData;
  late List<GetuserdrawnumbersResponseGet> allLotto = [];
  late List<TextEditingController> lottoControllers = [];
  late AllErrorResponseGet msg;
  late int i = 1;

  @override
  void initState() {
    super.initState();
    lottoControllers = [TextEditingController()];
    loadData = loadDataAsync();
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenSize.width * 0.32),
                    topRight: Radius.circular(screenSize.width * 0.32),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: screenSize.height * 0.076,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.01,
                    left: screenSize.width * 0.2,
                    right: screenSize.width * 0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "เลือกรอบที่ออกรางวัล",
                      style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.05),
                    ),
                    TextField(
                      controller: test,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month),
                          onPressed: () {},
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    FutureBuilder(
                      future: loadData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.only(top: screenSize.height * 0.06),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("กรอกหมายเลขสลาก",
                                  style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.045)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: screenSize.height * 0.01)),
                              ...List.generate(lottoControllers.length, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: screenSize.height * 0.01),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: screenSize.width * 0.45,
                                        child: TextField(
                                          controller: lottoControllers[index],
                                          keyboardType: TextInputType.number,
                                          maxLength: 6,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                                6),
                                          ],
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: 'กรอกหมายเลขสลาก',
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                  Icons.close_outlined),
                                              onPressed: () => deleteRecord(index),
                                            ),
                                            border:
                                                const OutlineInputBorder(),
                                            counterText: '',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  screenSize.width * 0.024)),
                                      if (index == lottoControllers.length - 1) ...[
                                        IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: screenSize.width * 0.06,
                                          ),
                                          style: IconButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    255, 59, 48, 1),
                                          ),
                                          onPressed: addRecord,
                                        )
                                      ]
                                    ],
                                  ),
                                );
                              }),
                              SizedBox(
                                width: screenSize.width * 1,
                                height: screenSize.height * 0.2,
                                child: Center(
                                  child: TextButton(
                                    onPressed: sendLottoNumbers,
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(
                                          255, 209, 128, 1),
                                      padding: EdgeInsets.symmetric(
                                          vertical: screenSize.height * 0.015,
                                          horizontal:
                                              screenSize.width * 0.08),
                                    ),
                                    child: Text(
                                      "ตรวจสลาก",
                                      style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize: screenSize.width * 0.04,
                                        color: const Color.fromARGB(
                                            255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  Future<void> loadDataAsync() async {
    try {
      var url = await loadUrl();
      var member = context.read<Data>();
      var memberId = member.mid;
      var response = await http.get(
        Uri.parse('$url/lottery/GetUserDrawNumbers/$memberId'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));

        if (jsonResponse is Map<String, dynamic>) {
          if (jsonResponse.containsKey('msg')) {
            try {
              msg = allErrorResponseGetFromJson(jsonResponse['msg']);
              log("Message from server: $msg");
            } catch (e) {
              log("Error parsing 'msg': $e");
            }
          }
        } else if (jsonResponse is List) {
          try {
            allLotto =
                getuserdrawnumbersResponseGetFromJson(jsonEncode(jsonResponse));
            _setLottoControllers();
          } catch (e) {
            log("Error parsing list of lotto data: $e");
          }
        }
      } else {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        msg = allErrorResponseGetFromJson(jsonResponse['msg']);
        log("Message from server: $msg");
      }
    } catch (e) {
      log("An error occurred: $e");
    }
  }

  Future<String> loadUrl() async {
    var value = await Configuration.getConfig();
    var url = value['apiEndpoint'];
    return url;
  }

  void sendLottoNumbers() async {
    var url = await loadUrl();
    List<GetwinningnumbersRequestGet> lottoNumbers = [];

    for (var controller in lottoControllers) {
      lottoNumbers.add(GetwinningnumbersRequestGet(number: controller.text));
    }

    String jsonData = getwinningnumbersRequestGetToJson(lottoNumbers);

    var response = await http.post(Uri.parse('$url/lottery/GetWinningNumbers'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonData);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse is Map<String, dynamic>) {
        if (jsonResponse.containsKey('msg')) {
          try {
            msg = allErrorResponseGetFromJson(jsonEncode(jsonResponse['msg']));
            log("Message from server: $msg");
          } catch (e) {
            log("Error parsing 'msg': $e");
          }
        }
      } else if (jsonResponse is List) {
        List<GetwinningnumbersResponseGet> checkwinner;

        checkwinner =
            getwinningnumbersResponseGetFromJson(jsonEncode(jsonResponse));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultLottoPage(result: checkwinner),
          ),
        );
      }
    } else {
      var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      if (jsonResponse is Map<String, dynamic>) {
        if (jsonResponse.containsKey('msg')) {
          try {
            msg = allErrorResponseGetFromJson(jsonEncode(jsonResponse['msg']));
            log("Message from server: $msg");
          } catch (e) {
            log("Error parsing 'msg': $e");
          }
        }
      }
    }
  }

  void _setLottoControllers() {
    List<TextEditingController> tempControllers = [];

    if (allLotto.isNotEmpty) {
      for (var lotto in allLotto) {
        var controller = TextEditingController(text: lotto.number);
        tempControllers.add(controller);
      }
    } else {
      var controller = TextEditingController(text: "");
      tempControllers.add(controller);
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          lottoControllers = tempControllers;
        });
      }
    });
  }

  void addRecord() {
    setState(() {
      lottoControllers.add(TextEditingController());
    });
  }

  void deleteRecord(int index) {
    setState(() {
      if (lottoControllers.length > 1) {
        lottoControllers.removeAt(index);
      }
    });
  }
}