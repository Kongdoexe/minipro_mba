import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:http/http.dart' as http;

class MyLottoPage extends StatefulWidget {
  // int memberId = 0;
  // MyLottoPage({super.key, required this.memberId});

  const MyLottoPage({super.key});
  @override
  State<MyLottoPage> createState() => _MyLottoPageState();
}

class _MyLottoPageState extends State<MyLottoPage> {
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
                    onPressed: () {},
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
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceAround, // จัดระยะห่างอัตโนมัติระหว่าง elements
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.02,
                        vertical: screenSize.height * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: screenSize.width * 0.46,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.002,
                            vertical: screenSize.height * 0.005,
                          ),
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          child: Center(
                            // เพิ่ม Center widget ตรงนี้
                            child: Text(
                              formatNumber("486921"),
                              style: TextStyle(
                                fontFamily: 'MaliMedium',
                                fontSize: screenSize.width * 0.046,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign:
                                  TextAlign.center, // เพิ่ม textAlign property
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.height * 0.026),
                          child: Text(
                            "งวดที่ 1",
                            style: TextStyle(
                              fontFamily: 'MaliMedium',
                              fontSize: screenSize.width * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "80 บาท",
                    style: TextStyle(
                        fontFamily: 'MaliMedium',
                        fontSize: screenSize.width * 0.04),
                  ),
                ],
              ),
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

  String formatNumber(String number) {
    return number.split('').join('   ');
  }
}
