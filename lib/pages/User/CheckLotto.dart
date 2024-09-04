import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/getwinningnumbers_request_get.dart';
import 'package:minipro_mba/models/response/getuserdrawnumbers_response_get.dart';
import 'package:minipro_mba/models/response/allerrorresponseget.dart';
import 'package:minipro_mba/models/response/getwinningnumbers_response_get.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/ResultLotto.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CheckLottoPage extends StatefulWidget {
  const CheckLottoPage({Key? key}) : super(key: key);

  @override
  State<CheckLottoPage> createState() => _CheckLottoPageState();
}

class _CheckLottoPageState extends State<CheckLottoPage> {
  TextEditingController test = TextEditingController();
  final myWidget = MyWidget();
  String _text = '';
  late Future<void> loadData;
  List<GetuserdrawnumbersResponseGet> allLotto = [];
  List<TextEditingController> lottoControllers = [];
  late Allerrorresponseget msg;

  @override
  void initState() {
    super.initState();
    lottoControllers.add(TextEditingController());
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
        allPrice: 0,
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
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                  horizontal: screenSize.width * 0.2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "เลือกรอบที่ออกรางวัล",
                      style: TextStyle(
                        fontFamily: 'MaliMedium',
                        fontSize: screenSize.width * 0.05,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width * 0.012,
                                    vertical: screenSize.height * 0.016,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: screenSize.width * 0.04,
                                    ),
                                    child: Text(
                                      _text,
                                      style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize: screenSize.width * 0.047,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.calendar_month),
                                onPressed: () => showDialogg(context),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height * 0.06,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "กรอกหมายเลขสลาก",
                                style: TextStyle(
                                  fontFamily: 'MaliMedium',
                                  fontSize: screenSize.width * 0.045,
                                ),
                              ),
                              FutureBuilder<void>(
                                future: loadData,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState !=
                                      ConnectionState.done) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }

                                  if (snapshot.hasError) {
                                    return Center(
                                        child:
                                            Text('Error: ${snapshot.error}'));
                                  }

                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenSize.height * 0.01,
                                        ),
                                      ),
                                      ...List.generate(
                                        lottoControllers.length,
                                        (index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              bottom: screenSize.height * 0.01,
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width:
                                                      screenSize.width * 0.45,
                                                  child: TextField(
                                                    controller:
                                                        lottoControllers[index],
                                                    keyboardType:
                                                        TextInputType.number,
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
                                                      hintText:
                                                          'กรอกหมายเลขสลาก',
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(Icons
                                                            .close_outlined),
                                                        onPressed: () =>
                                                            deleteRecord(index),
                                                      ),
                                                      border:
                                                          const OutlineInputBorder(),
                                                      counterText: '',
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: screenSize.width *
                                                        0.024,
                                                  ),
                                                ),
                                                if (index ==
                                                    lottoControllers.length - 1)
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: screenSize.width *
                                                          0.06,
                                                    ),
                                                    style: IconButton.styleFrom(
                                                      backgroundColor:
                                                          const Color.fromRGBO(
                                                              255, 59, 48, 1),
                                                    ),
                                                    onPressed: addRecord,
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                width: screenSize.width,
                                height: screenSize.height * 0.2,
                                child: Center(
                                  child: TextButton(
                                    onPressed: sendLottoNumbers,
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(
                                          255, 209, 128, 1),
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenSize.height * 0.015,
                                        horizontal: screenSize.width * 0.08,
                                      ),
                                    ),
                                    child: Text(
                                      "ตรวจสลาก",
                                      style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize: screenSize.width * 0.04,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

  void showDialogg(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 149, 0, 0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  _text, // ข้อความหัวเรื่อง
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // ปิด Dialog
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromRGBO(255, 34, 34, 1)),
                    ),
                    child: const Center(
                      child: Text(
                        'เลือก',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadDataAsync() async {
    try {
      final url = await loadUrl();
      final member = context.read<Data>();
      setState(() {
        _text = "รอบที่ ${member.period}";
      });
      final memberId = member.datauser.memberId;
      final response = await http.get(
        Uri.parse('$url/lottery/GetUserDrawNumbers/$memberId'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

        if (jsonResponse is Map<String, dynamic> || jsonResponse is String) {
          _handleError(response);
        } else if (jsonResponse is List) {
          try {
            allLotto =
                getuserdrawnumbersResponseGetFromJson(jsonEncode(jsonResponse));
            _setLottoControllers();
          } catch (e) {
            myWidget.showCustomSnackbar(
                "Message", "Error parsing list of lotto data: $e");
          }
        }
      } else {
        _handleError(response);
      }
    } catch (e) {
      myWidget.showCustomSnackbar('Error', 'An error occurred: $e');
    }
  }

  Future<String> loadUrl() async {
    final value = await Configuration.getConfig();
    return value['apiEndpoint'];
  }

  Future<void> sendLottoNumbers() async {
    final url = await loadUrl();
    final userData = context.read<Data>();
    final datanum = lottoControllers
        .map((controller) => Datanum(number: controller.text))
        .toList();
    final lotto =
        GetwinningnumbersRequestGet(period: userData.period, datanum: datanum);
    final jsonData = getwinningnumbersRequestGetToJson(lotto);

    try {
      final response = await http.post(
        Uri.parse('$url/lottery/GetWinningNumbers'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonData,
      );

      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        if (jsonResponse is Map<String, dynamic> || jsonResponse is String) {
          _handleError(response);
        } else if (jsonResponse is List) {
          final checkwinner =
              getwinningnumbersResponseGetFromJson(jsonEncode(jsonResponse));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultLottoPage(result: checkwinner),
            ),
          );
        }
      } else {
        _handleError(response);
      }
    } catch (e) {
      myWidget.showCustomSnackbar('Error', 'Network request failed: $e');
    }
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

  void _setLottoControllers() {
    List<TextEditingController> tempControllers = [];

    for (var lotto in allLotto) {
      var controller = TextEditingController(text: lotto.number);
      tempControllers.add(controller);
    }

    if (tempControllers.isEmpty) {
      tempControllers.add(TextEditingController(text: ""));
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
