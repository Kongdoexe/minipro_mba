import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';

class ResultLottoPage extends StatefulWidget {
  const ResultLottoPage({super.key});

  @override
  State<ResultLottoPage> createState() => _ResultLottoPageState();
}

class _ResultLottoPageState extends State<ResultLottoPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<bool> results = [true, true, true];

  @override
  void initState() {
    super.initState();
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
      appBar: CustomAppBar(screenSize: screenSize),
      body: Stack(
        children: [
          Positioned.fill(
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
                        children: results
                            .map((result) => result
                                ? buildTrueWidget(screenSize)
                                : buildFalseWidget(screenSize))
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(results.length, (index) {
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
          ),
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
                    onPressed: CheckScreen,
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

  void CheckScreen() {
    final screenSize = MediaQuery.of(context).size;
    log("Width :${screenSize.width}");
    log("Height :${screenSize.height}");
  }

  Widget buildTrueWidget(Size screenSize) {
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
            "451238",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.06,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "งวดประจำรอบที่ 1",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: screenSize.height * 0.015),
          Text(
            "ถูกรางวัลที่ 1",
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
            "6,000,000",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.05,
              color: const Color.fromRGBO(213, 11, 0, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            "บาท",
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

  Widget buildFalseWidget(Size screenSize) {
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
            "451238",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.065,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          Text(
            "งวดประจำรอบที่ 1",
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
}
