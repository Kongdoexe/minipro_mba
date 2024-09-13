
import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/response/getprize_response_get.dart';
import 'package:minipro_mba/pages/User/ChooseLotto.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Homepageuser extends StatefulWidget {
  const Homepageuser({super.key});

  @override
  State<Homepageuser> createState() => _HomepageuserState();
}

class _HomepageuserState extends State<Homepageuser> {
  String url = '';
  List<GetprizeResponseGet> prizeData = [];
  bool isSelected = false;
  int index = 0;
  final TextEditingController periodController = TextEditingController();
  GetprizeResponseGet? selectedPrizeData;
  int? selectedPeriod;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final userModel = context.watch<Data>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'หน้าหลัก',
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 227, 227),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenSize.width * 0.32),
                    topRight: Radius.circular(screenSize.width * 0.32),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.05),
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  width: screenSize.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.04),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.04),
                          ),
                          child: SizedBox(
                            width: screenSize.width * 0.8,
                            height: screenSize.height * 0.11,
                            child: Padding(
                              padding: EdgeInsets.all(screenSize.width * 0.07),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ยอดเงินคงเหลือ:  ',
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.05,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text('${userModel.datauser.wallet}',
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.05,
                                      fontWeight: FontWeight.w700,
                                    ),),
                                    Image.asset(
                                    'assets/images/money2.png',
                                    width: screenSize.width * 0.08,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Text(
                        'เลือกงวดรางวัลที่ออก',
                        style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.04,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.04),
                        ),
                        child: SizedBox(
                          width: screenSize.width * 0.8,
                          height: screenSize.height * 0.1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'รอบที่ ${selectedPeriod != null ? selectedPeriod : 'X'}',
                                  style: TextStyle(
                                    fontFamily: 'MaliMedium',
                                    fontSize: screenSize.width * 0.07,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                TextButton(
                                  onPressed: Select,
                                  child: Image.asset(
                                    'assets/images/calendar.png',
                                    width: screenSize.width * 0.07,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height * 0.03),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.08),
                          ),
                          child: SizedBox(
                            width: screenSize.width * 0.8,
                            height: screenSize.height * 0.56,
                            child: Column(
                              children: [
                                if (prizeData.isNotEmpty && isSelected) ...[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height * 0.02),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'รางวัลที่ 1',
                                          style: TextStyle(
                                            fontFamily: 'MaliMedium',
                                            fontSize: screenSize.width * 0.06,
                                            fontWeight: FontWeight.w800,
                                            color: const Color.fromRGBO(
                                                230, 77, 77, 1),
                                          ),
                                        ),
                                        Text(
                                          '${prizeData.first.results.first.number}', // แสดงหมายเลขรางวัลที่ 1
                                          style: TextStyle(
                                            fontFamily: 'MaliMedium',
                                            fontSize: screenSize.width * 0.07,
                                            fontWeight: FontWeight.w300,
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                          ),
                                        ),
                                        Text(
                                          'รางวัลละ${prizeData.first.results.first.gratuity}฿', // แสดงจำนวนเงินรางวัลที่ 1
                                          style: TextStyle(
                                            fontFamily: 'MaliMedium',
                                            fontSize: screenSize.width * 0.035,
                                            fontWeight: FontWeight.w300,
                                            color: const Color.fromRGBO(
                                                85, 83, 83, 1),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              screenSize.width * 0.02),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ...prizeData.first.results
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                int index = entry.key;
                                                var result = entry.value;
                                                if (index == 1) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: screenSize.height *
                                                            0.02),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'รางวัลที่ 2',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.06,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: const Color
                                                                .fromRGBO(
                                                                230, 77, 77, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${result.number}', // แสดงหมายเลขลอตเตอรี่
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.06,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color
                                                                .fromRGBO(
                                                                0, 0, 0, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          'รางวัลละ${result.gratuity}฿', // แสดงจำนวนเงินรางวัล
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.035,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color
                                                                .fromRGBO(
                                                                85, 83, 83, 1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return Container();
                                              }).toList(),
                                              ...prizeData.first.results
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                int index = entry.key;
                                                var result = entry.value;
                                                if (index == 2) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: screenSize.height *
                                                            0.02),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'รางวัลที่ 3',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.06,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: const Color
                                                                .fromRGBO(
                                                                230, 77, 77, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${result.number}', // แสดงหมายเลขลอตเตอรี่
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.06,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color
                                                                .fromRGBO(
                                                                0, 0, 0, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          'รางวัลละ${result.gratuity}฿', // แสดงจำนวนเงินรางวัล
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.035,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color
                                                                .fromRGBO(
                                                                85, 83, 83, 1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return Container();
                                              }).toList(),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: screenSize.width * 0.05,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ...prizeData.first.results
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                int index = entry.key;
                                                var result = entry.value;
                                                if (index == 3) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: screenSize.height *
                                                            0.02),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'รางวัลที่ 4',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.06,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: const Color
                                                                .fromRGBO(
                                                                230, 77, 77, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${result.number}', // แสดงหมายเลขลอตเตอรี่
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.06,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color
                                                                .fromRGBO(
                                                                0, 0, 0, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          'รางวัลละ${result.gratuity}฿', // แสดงจำนวนเงินรางวัล
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.035,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color
                                                                .fromRGBO(
                                                                85, 83, 83, 1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return Container();
                                              }).toList(),
                                              ...prizeData.first.results
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                int index = entry.key;
                                                var result = entry.value;
                                                if (index == 4) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: screenSize.height *
                                                            0.02),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'รางวัลที่ 5',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.06,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: const Color
                                                                .fromRGBO(
                                                                230, 77, 77, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${result.number}', // แสดงหมายเลขลอตเตอรี่
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.06,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color
                                                                .fromRGBO(
                                                                0, 0, 0, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          'รางวัลละ${result.gratuity}฿', // แสดงจำนวนเงินรางวัล
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'MaliMedium',
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.035,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color
                                                                .fromRGBO(
                                                                85, 83, 83, 1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return Container();
                                              }).toList(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height *
                                            0.04), // ใช้ screenSize
                                    child: Column(
                                      children: [
                                        Container(
                                          width: screenSize.width *
                                              0.7, // ใช้ screenSize
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: screenSize.height *
                                              0.02, // ใช้ screenSize
                                        ),
                                        FilledButton(
                                          onPressed: () => buylotto(context),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenSize.width *
                                                  0.08, // ใช้ screenSize
                                              vertical: screenSize.height *
                                                  0.015, // ใช้ screenSize
                                            ),
                                            fixedSize: Size(
                                              screenSize.width *
                                                  0.4, // ใช้ screenSize
                                              screenSize.height *
                                                  0.06, // ใช้ screenSize
                                            ),
                                          ),
                                          child: Text(
                                            'ซื้อสลาก',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'MaliMedium',
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenSize.width *
                                                  0.035, // ใช้ screenSize
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ] else ...[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height * 0.02),
                                    child: Text(
                                      'รางวัลที่ 1',
                                      style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize: screenSize.width * 0.06,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromRGBO(
                                            230, 77, 77, 1),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'xxxxxx',
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.07,
                                      fontWeight: FontWeight.w300,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                  Text(
                                    'รางวัลละ xx ฿',
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.035,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          const Color.fromRGBO(85, 83, 83, 1),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenSize.width *
                                          0.05, // ใช้ screenSize
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenSize.height *
                                                      0.02), // ใช้ screenSize
                                              child: Text(
                                                'รางวัลที่ 2',
                                                style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: screenSize.width *
                                                      0.04, // ใช้ screenSize
                                                  fontWeight: FontWeight.w800,
                                                  color: const Color.fromRGBO(
                                                      230, 77, 77, 1),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'xxxxxx',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.06, // ใช้ screenSize
                                                fontWeight: FontWeight.w300,
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                              ),
                                            ),
                                            Text(
                                              'รางวัลละ xx ฿',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.035, // ใช้ screenSize
                                                fontWeight: FontWeight.w300,
                                                color: const Color.fromRGBO(
                                                    85, 83, 83, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenSize.height *
                                                      0.02), // ใช้ screenSize
                                              child: Text(
                                                'รางวัลที่ 3',
                                                style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: screenSize.width *
                                                      0.04, // ใช้ screenSize
                                                  fontWeight: FontWeight.w800,
                                                  color: const Color.fromRGBO(
                                                      230, 77, 77, 1),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'xxxxxx',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.06, // ใช้ screenSize
                                                fontWeight: FontWeight.w300,
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                              ),
                                            ),
                                            Text(
                                              'รางวัลละ xx ฿',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.035, // ใช้ screenSize
                                                fontWeight: FontWeight.w300,
                                                color: const Color.fromRGBO(
                                                    85, 83, 83, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: screenSize.width * 0.05,
                                      left: screenSize.width * 0.05,
                                      top: screenSize.height * 0.04,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenSize.height *
                                                      0.02), // ใช้ screenSize
                                              child: Text(
                                                'รางวัลที่ 4',
                                                style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: screenSize.width *
                                                      0.04, // ใช้ screenSize
                                                  fontWeight: FontWeight.w800,
                                                  color: const Color.fromRGBO(
                                                      230, 77, 77, 1),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'xxxxxx',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.06, // ใช้ screenSize
                                                fontWeight: FontWeight.w300,
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                              ),
                                            ),
                                            Text(
                                              'รางวัลละ xx ฿',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.035, // ใช้ screenSize
                                                fontWeight: FontWeight.w300,
                                                color: const Color.fromRGBO(
                                                    85, 83, 83, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: screenSize.height *
                                                      0.02), // ใช้ screenSize
                                              child: Text(
                                                'รางวัลที่ 5',
                                                style: TextStyle(
                                                  fontFamily: 'MaliMedium',
                                                  fontSize: screenSize.width *
                                                      0.04, // ใช้ screenSize
                                                  fontWeight: FontWeight.w800,
                                                  color: const Color.fromRGBO(
                                                      230, 77, 77, 1),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'xxxxxx',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.06, // ใช้ screenSize
                                                fontWeight: FontWeight.w300,
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                              ),
                                            ),
                                            Text(
                                              'รางวัลละ xx ฿',
                                              style: TextStyle(
                                                fontFamily: 'MaliMedium',
                                                fontSize: screenSize.width *
                                                    0.035, // ใช้ screenSize
                                                fontWeight: FontWeight.w300,
                                                color: const Color.fromRGBO(
                                                    85, 83, 83, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height *
                                            0.04), // ใช้ screenSize
                                    child: Column(
                                      children: [
                                        Container(
                                          width: screenSize.width *
                                              0.7, // ใช้ screenSize
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: screenSize.height *
                                              0.02, // ใช้ screenSize
                                        ),
                                        FilledButton(
                                          onPressed: () => buylotto(context),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenSize.width *
                                                  0.08, // ใช้ screenSize
                                              vertical: screenSize.height *
                                                  0.015, // ใช้ screenSize
                                            ),
                                            fixedSize: Size(
                                              screenSize.width *
                                                  0.4, // ใช้ screenSize
                                              screenSize.height *
                                                  0.06, // ใช้ screenSize
                                            ),
                                          ),
                                          child: Text(
                                            'ซื้อสลาก',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'MaliMedium',
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenSize.width *
                                                  0.035, // ใช้ screenSize
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  void buylotto(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooselottoPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (value) {
        setState(() {
          url = value['apiEndpoint'].toString(); // กำหนดค่า url จาก config
        });
      },
    ).catchError((err) {
      print('Error in initState: $err');
    });
  }

  Future<void> Select() async {
    try {
      var response = await http.get(
        Uri.parse('$url/draw/Getprize'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
      );

      if (response.statusCode == 200) {
        List<GetprizeResponseGet> fetchedPrizeData =
            getprizeResponseGetFromJson(response.body);

        int? maxPeriod = fetchedPrizeData
            .map((e) => e.period)
            .reduce((a, b) => a! > b! ? a : b);

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
                      "กรอกรอบที่ต้องการดู (1-${maxPeriod})",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: periodController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: FilledButton(
                        onPressed: () {
                          int enteredPeriod =
                              int.tryParse(periodController.text) ?? 0;
                          var selectedPrize = fetchedPrizeData.firstWhere(
                            (item) => item.period == enteredPeriod,
                            orElse: () =>
                                GetprizeResponseGet(period: 0, results: []),
                          );

                          if (selectedPrize.period != 0) {
                            setState(() {
                              selectedPeriod = enteredPeriod;
                              updatePrizeData(selectedPrize);
                            });
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('ไม่พบข้อมูลสำหรับรอบที่กรอก')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(255, 34, 34, 1)),
                        ),
                        child: const Center(
                          child: Text(
                            'ตกลง',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
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
                  const Text(
                    "งวดนี้ยังไม่ออกรางวัล",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(255, 34, 34, 1)),
                      ),
                      child: const Center(
                        child: Text(
                          'ตกลง',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      print("Error: $e");
    }
  }

  void updatePrizeData(GetprizeResponseGet selectedPrize) {
    setState(() {
      prizeData = [selectedPrize];
      isSelected = true;
    });
  }
}
