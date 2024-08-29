import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart'; // Make sure to include this package if you want to use Iconsax icons

class CheckLottoPage extends StatefulWidget {
  const CheckLottoPage({super.key});

  @override
  State<CheckLottoPage> createState() => _CheckLottoPageState();
}

class _CheckLottoPageState extends State<CheckLottoPage> {
  TextEditingController test = TextEditingController(text: "รอบที่ 1");
  int i = 1;

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
                    Padding(
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
                          ...List.generate(i, (index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: screenSize.height * 0.01),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      maxLength: 6,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(6),
                                      ],
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'กรอกหมายเลขสลาก',
                                        suffixIcon: IconButton(
                                          icon:
                                              const Icon(Icons.close_outlined),
                                          onPressed: deleteRecode,
                                        ),
                                        border: const OutlineInputBorder(),
                                        counterText: '',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: screenSize.width * 0.024)),
                                  if (index == i - 1) ...[
                                    IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: screenSize.width * 0.06,
                                      ),
                                      style: IconButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
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
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(255, 209, 128, 1),
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenSize.height * 0.015,
                                      horizontal: screenSize.width * 0.08),
                                ),
                                child: Text(
                                  "ตรวจสลาก",
                                  style: TextStyle(
                                    fontFamily: 'MaliMedium',
                                    fontSize: screenSize.width * 0.04,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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

  void addRecord() {
    setState(() {
      i += 1;
    });
  }

  void deleteRecode() {
    setState(() {
      if (i > 1) {
        i -= 1;
      }
    });
  }
}
