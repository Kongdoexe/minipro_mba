import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/generateuniquedraw_request_post.dart';
import 'package:minipro_mba/models/request/selectalllotto_request_get.dart';
import 'package:minipro_mba/models/response/generatemultipledraws_response_get.dart';
import 'package:minipro_mba/models/response/generateuniquedraw_response_post.dart';
import 'package:minipro_mba/models/response/getprize_response_get.dart';
import 'package:minipro_mba/pages/Admin/Admin_AppBar.dart';
import 'package:minipro_mba/pages/Admin/Admin_NavBar.dart';
import 'package:minipro_mba/share/ShareWidget.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  bool isPressed = false;
  late Future<List<GetprizeResponseGet>> loadData;
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
            SizedBox(height: screenSize.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLottoButton(
                  context,
                  "ลอตโต้ที่ขายไปแล้ว",
                  !isPressed,
                  () {
                    setState(() {
                      isPressed = false;
                    });
                  },
                ),
                buildLottoButton(
                  context,
                  "ลอตโต้ทั้งหมด",
                  isPressed,
                  () {
                    setState(() {
                      isPressed = true;
                    });
                  },
                ),
              ],
            ),
            Divider(color: Colors.white, thickness: screenSize.height * 0.003),
            SizedBox(
              width: screenSize.width * 0.45,
              height: screenSize.height * 0.05,
              child: TextButton(
                onPressed: () => randomAllLotto(isPressed),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 247, 160, 80),
                ),
                child: Text(
                  "สุ่มออกรางวัลทั้งหมด",
                  style: TextStyle(
                    fontFamily: 'MaliMedium',
                    fontSize: screenSize.width * 0.036,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.white, thickness: screenSize.height * 0.003),
            Expanded(
              child: FutureBuilder<List<GetprizeResponseGet>>(
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
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return buildPrizeCard(context, index + 1, null);
                      },
                    );
                  }
                  final lastPeriod = snapshot.data!.last;
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      if (index < lastPeriod.results.length) {
                        return buildPrizeCard(context, index + 1, lastPeriod);
                      } else {
                        return buildPrizeCard(context, index + 1, null);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
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

  Widget buildPrizeCard(
      BuildContext context, int index, GetprizeResponseGet? winner) {
    final screenSize = MediaQuery.of(context).size;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.04,
          vertical: screenSize.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "รางวัลที่ $index: ",
                  style: TextStyle(
                    fontFamily: 'MaliMedium',
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  formatNumber(winner?.results[index - 1].number ?? "XXXXXX"),
                  style: TextStyle(
                    fontFamily: 'MaliMedium',
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.012),
            SizedBox(
              width: screenSize.width * 0.34,
              height: screenSize.height * 0.05,
              child: TextButton(
                onPressed: () => randomLotto(index, isPressed),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(252, 225, 87, 1),
                ),
                child: Text(
                  "สุ่มออกรางวัล",
                  style: TextStyle(
                    fontFamily: 'MaliMedium',
                    fontSize: screenSize.width * 0.036,
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
  }

  String formatNumber(String number) {
    return number.split('').join(' ');
  }

  Future<List<GetprizeResponseGet>> loadDataAsync() async {
    try {
      final url = await loadUrl();
      final response = await http.get(Uri.parse("$url/draw/Getprize"));

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);

        if (responseBody.isEmpty) {
          return [];
        }

        final List<GetprizeResponseGet> data =
            getprizeResponseGetFromJson(responseBody);
        return data;
      } else {
        handleError.handleError(response);
        return [];
      }
    } catch (e) {
      myWidget.showCustomSnackbar(
          "Message", "An error occurred during request: $e");
      return [];
    }
  }

  Future<String> loadUrl() async {
    final value = await Configuration.getConfig();
    return value['apiEndpoint'];
  }

  Future<void> randomAllLotto(bool status) async {
    try {
      final url = await loadUrl();
      var body = SelectalllottoRequestGet(status: status);
      final jsonBody = selectalllottoRequestGetToJson(body);

      final response = await http.post(
        Uri.parse("$url/draw/GenerateMultipleDraws"),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        var resultall = generatemultipledrawsResponseGetFromJson(response.body);
        for (var result in resultall) {
          myWidget.showCustomSnackbar("Message",
              "ออกรางวัลที่ ${result.rank} เลขที่ออกคือ ${result.number}");
        }
        setState(() {
          loadData = loadDataAsync();
        });
      } else {
        handleError.handleError(response);
      }
    } catch (e) {
      myWidget.showCustomSnackbar(
          "Message", "An error occurred during request: $e");
    }
  }

  Future<void> randomLotto(int number, bool status) async {
    try {
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
        setState(() {
          loadData = loadDataAsync();
        });
      } else {
        handleError.handleError(response);
      }
    } catch (e) {
      myWidget.showCustomSnackbar(
          "Message", "An error occurred during request: $e");
    }
  }
}
