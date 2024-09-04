import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/response/getwinningnumbers_response_get.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';

class ResultLottoPage extends StatefulWidget {
  final List<GetwinningnumbersResponseGet> result;
  const ResultLottoPage({super.key, required this.result});

  @override
  State<ResultLottoPage> createState() => _ResultLottoPageState();
}

class _ResultLottoPageState extends State<ResultLottoPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Future<void> loadData;

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
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
          FutureBuilder(
              future: loadData,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: screenSize.width * 0.12,
                      left: screenSize.width * 0.12,
                      bottom: screenSize.height * 0.135,
                      top: screenSize.height * 0.06,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView(
                              controller: _pageController,
                              children: widget.result
                                  .map((result) => result.hasWinner
                                      ? buildTrueWidget(screenSize, result)
                                      : buildFalseWidget(screenSize, result))
                                  .toList(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: screenSize.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  List.generate(widget.result.length, (index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: screenSize.width * 0.014),
                                  width: screenSize.width * 0.025,
                                  height: screenSize.height * 0.025,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentPage == index
                                        ? const Color.fromARGB(255, 0, 0, 0)
                                        : Colors.grey,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Positioned.fill(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.01),
                  child: Text(
                    "ผลการตรวจรางวัล",
                    style: TextStyle(
                      fontFamily: 'MaliMedium',
                      fontSize: screenSize.width * 0.046,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: screenSize.width * 0.35,
                  height: screenSize.height * 0.06,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 209, 128, 1),
                    ),
                    child: Text(
                      "รับรางวัล",
                      style: TextStyle(
                        fontFamily: 'MaliMedium',
                        fontSize: screenSize.width * 0.04,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
              ],
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

  Widget buildTrueWidget(Size screenSize, GetwinningnumbersResponseGet result) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenSize.width,
            child: Image.asset(
              "assets/images/Cheap.png",
              height: screenSize.height * 0.31,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          Text(
            result.number,
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.06,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "งวดประจำรอบที่ ${result.period}",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: screenSize.height * 0.015),
          Text(
            "ถูกรางวัลที่ ${result.rank}",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.044,
              color: const Color.fromRGBO(213, 11, 0, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            "เงินรางวัล",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Text(
            "${result.gratuity} บาท",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.05,
              color: const Color.fromRGBO(213, 11, 0, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFalseWidget(
      Size screenSize, GetwinningnumbersResponseGet result) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenSize.width,
            child: Image.asset(
              "assets/images/Not_cheap.png",
              height: screenSize.height * 0.31,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Text(
            result.number,
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.065,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          Text(
            "งวดประจำรอบที่ ${result.period}",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Text(
            "ไม่ถูกรางวัล",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.046,
              color: const Color.fromRGBO(213, 11, 0, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            "ครั้งนี้ไม่ถูกครั้งหน้า",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Text(
            "ชีวิตยังอีกยาวไกล",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> loadUrl() async {
    var value = await Configuration.getConfig();
    var url = value['apiEndpoint'];
    return url;
  }

  Future<void> loadDataAsync() async {
    try {
      // var url = await loadUrl();
      if (widget.result.contains(true)) {
        log("message");
      }
    } catch (e) {
      log("An error occurred: $e");
    }
  }
}
