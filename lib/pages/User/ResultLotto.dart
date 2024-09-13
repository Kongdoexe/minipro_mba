import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/addwinningstowallet_request_post.dart';
import 'package:minipro_mba/models/response/getwinningnumbers_response_get.dart';
import 'package:minipro_mba/pages/User/CheckLotto.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../share/ShareData.dart';

class ResultLottoPage extends StatefulWidget {
  final List<GetwinningnumbersResponseGet> result;
  const ResultLottoPage({super.key, required this.result});

  @override
  State<ResultLottoPage> createState() => _ResultLottoPageState();
}

class _ResultLottoPageState extends State<ResultLottoPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isLoading = true;
  late bool hasTrue;
  late bool hasPeriodlast;
  final myWidget = MyWidget();
  final handleError = HandleError();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
    _loadData();
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    if (mounted) {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    }
  }

  Future<void> _loadData() async {
    try {
      await loadDataAsync(context);
    } catch (e, stacktrace) {
      log("An error occurred: $e, stacktrace: $stacktrace");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
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
                          children: widget.result
                              .map((result) => result.hasWinner
                                  ? buildTrueWidget(screenSize, result)
                                  : buildFalseWidget(screenSize, result))
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: screenSize.height * 0.01),
                        child: Wrap(
                          spacing: screenSize.width * 0.012,
                          runSpacing:
                              screenSize.height * 0.01, // ระยะห่างระหว่างแถว
                          alignment: WrapAlignment.center, // จัดแนวตามแนวนอน
                          children:
                              List.generate(widget.result.length, (index) {
                            return Container(
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
                    onPressed: () {
                      hasTrue && hasPeriodlast ? cashIN() : backtoCheckLotto();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 209, 128, 1),
                    ),
                    child: Text(
                      hasTrue && hasPeriodlast ? "ขึ้นเงินรางวัล" : "ตกลง",
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

  Future<void> loadDataAsync(BuildContext context) async {
    try {
      final data = context.read<Data>();
      setState(() {
        hasTrue = widget.result.any((item) => item.hasWinner == true);
        hasPeriodlast = data.lastperiod == data.period;
      });
    } catch (e, stacktrace) {
      MyWidget().showCustomSnackbar(
          "Error", "An error occurred: $e, stacktrace: $stacktrace");
    }
  }

  void _setperiod() {
    final memberId = context.read<Data>();
    memberId.setPeriod(memberId.lastperiod);
  }

  void backtoCheckLotto() {
    _setperiod();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CheckLottoPage()),
    );
  }

  void cashIN() async {
    try {
      _setperiod();
      final data = context.read<Data>();
      final url = await loadUrl();
      var cashall = 0;
      List<Datum> bodyData = [];
      for (var result in widget.result) {
        bodyData.add(Datum(
          hasWinner: result.hasWinner,
          number: result.number,
          rank: result.rank,
          gratuity: result.gratuity,
          period: result.period,
        ));
        cashall += result.gratuity;
      }

      var body = AddwinningstowalletRequestPost(
        id: data.datauser.memberId,
        data: bodyData,
      );

      final jsonBody = addwinningstowalletRequestPostToJson(body);

      var response = await http.put(
        Uri.parse("$url/lottery/AddWinningsToWallet"),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        showSuccessAddWallet();
        double resultcash = (cashall + data.datauser.wallet) as double;
        data.updateWallet(resultcash);
      } else {
        handleError.handleError(response);
      }
    } catch (e, stacktrace) {
      myWidget.showCustomSnackbar(
          "Error", "An error occurred: $e, stacktrace: $stacktrace");
    }
  }

  void showSuccessAddWallet() {
    final screenSize = MediaQuery.of(context).size;
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
              Text(
                'ขึ้นเงินสำเร็จ',
                style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: screenSize.width * 0.08),
              ),
              Text(
                'จำนวนเงินถูกเพิ่มเข้า',
                style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: screenSize.width * 0.04),
              ),
              Text(
                'วอลเล็ทแล้ว',
                style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: screenSize.width * 0.04),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: screenSize.width * 0.4,
              child: FilledButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckLottoPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 230, 92, 87)),
                ),
                child: Text(
                  'ตกลง',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
