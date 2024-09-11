import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/generateuniquedraw_request_post.dart';
import 'package:minipro_mba/models/response/generateuniquedraw_response_post.dart';
import 'package:minipro_mba/models/response/getprize_response_get.dart';
import 'package:minipro_mba/pages/Admin/Admin_AppBar.dart';
import 'package:minipro_mba/pages/Admin/Admin_NavBar.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:http/http.dart' as http;

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  bool isPressed = false;
  late Future<void> loadData;
  late List<GetprizeResponseGet> resultWinner;
  final myWidget = MyWidget();
  final handleError = HandleError();

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 191, 90),
      appBar: AdminAppBar(screenSize: screenSize, namePage: "สุ่มออกรางวัล"),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.08,
            vertical: screenSize.height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "เลือกวิธีออกรางวัล",
                style: TextStyle(
                  fontFamily: 'MaliMedium',
                  fontSize: screenSize.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: screenSize.height * 0.01)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildLottoButton(
                    context,
                    "ลอตโต้ที่ขายไปแล้ว",
                    !isPressed,
                    () => setStateGenWinnerLotto(false),
                  ),
                  buildLottoButton(
                    context,
                    "ลอตโต้ทั้งหมด",
                    isPressed,
                    () => setStateGenWinnerLotto(true),
                  ),
                ],
              ),
              Divider(
                color: const Color.fromARGB(255, 255, 255, 255),
                thickness: screenSize.height * 0.003,
              ),
              FutureBuilder(
                future: loadData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  List<Widget> cards = [];
                  int minimumCards = 5;

                  if (!snapshot.hasData || resultWinner.isEmpty) {
                    // Create empty placeholder cards
                    cards = List.generate(minimumCards, (index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "รางวัลที่ ${index + 1}: ",
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "XXXXXX",
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.012,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.34,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: TextButton(
                                  onPressed: () => randomLotto(index + 1, isPressed),
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(252, 225, 87, 1),
                                  ),
                                  child: Text(
                                    "ออกรางวัล",
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.036,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  } else {
                    // Create actual winner cards
                    cards = resultWinner.map((winner) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "รางวัลที่ ${winner.rank}: ",
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    winner.memberId.toString(),
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.012,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.34,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: TextButton(
                                  onPressed: () =>
                                      randomLotto(winner.rank, isPressed),
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(252, 225, 87, 1),
                                  ),
                                  child: Text(
                                    "สุ่มออกรางวัล",
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.036,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList();

                    // If there are fewer than 5 winner cards, fill up with placeholders
                    if (cards.length < minimumCards) {
                      int placeholders = minimumCards - cards.length;
                      cards.addAll(List.generate(placeholders, (index) {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "รางวัลที่ ${cards.length + index + 1}: ",
                                      style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "sss",
                                      style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.34,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(252, 225, 87, 1),
                                    ),
                                    child: Text(
                                      "ไม่มีข้อมูล",
                                      style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.036,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }));
                    }
                  }

                  return Column(children: cards);
                },
              ),
            ],
          )),
      bottomNavigationBar: Adminnavbar(
        selectedIndex: 1,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  Widget buildLottoButton(BuildContext context, String text, bool isActive,
      VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.4,
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
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
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
      if (isPressed != newState) {
        isPressed = newState;
      }
    });
  }

  Future<void> loadDataAsync() async {
    try {
      final url = await loadUrl();
      final response = await http.get(Uri.parse("$url/draw/Getprize"));

      if (response.statusCode == 200) {
        resultWinner = getprizeResponseGetFromJson(response.body);
      } else {
        handleError.handleError(response);
      }
    } catch (e) {
      myWidget.showCustomSnackbar(
          "Message", "An error occurred during request: $e");
    }
  }

  Future<String> loadUrl() async {
    final value = await Configuration.getConfig();
    return value['apiEndpoint'];
  }

  void randomLotto(int number, bool status) async {
    try {
      print("number $number");
      final url = await loadUrl();
      var body = GenerateuniquedrawRequestPost(rank: number, status: status);
      final jsonBody = generateuniquedrawRequestPostToJson(body);

      final response = await http.post(
        Uri.parse("$url/draw/GenerateUniqueDraw"),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        var result = generateuniquedrawResponsePostFromJson(response.body);
        myWidget.showCustomSnackbar("Message",
            "ออกรางวัลที่ ${result.rank} เลขที่ออกคือ ${result.number}");
      } else {
        handleError.handleError(response);
      }
    } catch (e) {
      myWidget.showCustomSnackbar(
          "Message", "An error occurred during request: $e");
    }
  }
}
