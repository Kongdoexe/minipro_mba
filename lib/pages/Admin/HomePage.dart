import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/response/getsalesdata_response_get.dart';
import 'package:minipro_mba/pages/Admin/Admin_AppBar.dart';
import 'package:minipro_mba/pages/Admin/Admin_NavBar.dart';
import 'package:http/http.dart' as http;
import 'dart:developer'; 
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<GetsalesdataResponseGet>? salesdata;

  @override
  void initState() {
    super.initState();
    salesdata = fetchSalesData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 191, 90),
      appBar: AdminAppBar(screenSize: screenSize, namePage: "ระบบล็อตโต้"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: screenSize.height * 0.02)),
            Image.asset(
              'assets/images/lotto.png',
              width: screenSize.width * 1,
              height: screenSize.height * 0.32,
            ),
            FutureBuilder<GetsalesdataResponseGet>(
              future: salesdata,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data == null) {
                  return const Center(child: Text('No data available'));
                } else {
                  final data = snapshot.data!;
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.05,
                          vertical: screenSize.height * 0.04),
                      child: SizedBox(
                        width: screenSize.width * 0.74,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "เงินทั้งหมดจากการขาย(บาท): ",
                                  style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data.salesSummary.toString(),
                                  style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.038,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromRGBO(255, 34, 34, 1)),
                                )
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenSize.height * 0.018)),
                            Row(
                              children: [
                                Text(
                                  "จำนวนลอตโต้ที่ขายได้(ใบ): ",
                                  style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data.soldNumbersCount.toString(),
                                  style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.038,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromRGBO(255, 34, 34, 1)),
                                )
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenSize.height * 0.018)),
                            Row(
                              children: [
                                Text("จำนวนลอตโต้ที่เหลือ(ใบ): ",
                                    style: TextStyle(
                                        fontFamily: 'MaliMedium',
                                        fontSize: screenSize.width * 0.04,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  data.remainingNumbersCount.toString(),
                                  style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: screenSize.width * 0.038,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromRGBO(255, 34, 34, 1)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(padding: EdgeInsets.only(top: screenSize.height * 0.01)),
            SizedBox(
              width: screenSize.width * 0.3,
              height: screenSize.height * 0.072,
              child: TextButton(
                  onPressed: resetLotto,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(199, 28, 16, 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "รีเซ็ทระบบ",
                      style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.034,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: screenSize.height * 0.01)),
            SizedBox(
              width: screenSize.width * 0.3,
              height: screenSize.height * 0.072,
              child: TextButton(
                  onPressed: insertlotto,
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(199, 28, 16, 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "เพิ่มลอตโต",
                      style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.034,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: Adminnavbar(
        selectedIndex: 0,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  resetLotto() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 247, 31, 31),
        title: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/sign.png',
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              const Center(
                child: Text(
                  'คุณต้องการรีข้อมูล',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ),
              const Center(
                child: Text(
                  'ทั้งระบบจริงหรือ',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 240, 192, 48)),
                ),
                child: const Center(
                    child: Text(
                  'ปิด',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  reset(); // ปิด Dialog
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 240, 192, 48)),
                ),
                child: const Center(
                    child: Text(
                  'ตกลง',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }

  insertlotto() async {
    try {
      var config = await Configuration.getConfig();
      var url = config['apiEndpoint'];

      var response = await http.post(Uri.parse('$url/lottery/insertLottery'));

      if (response.statusCode == 200) {
        // Assuming `data` contains the lotto results.
        setState(() {
          var data = jsonDecode(response.body);
          log(jsonEncode(data));
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 247, 31, 31),
            title: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/check.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const Text(
                    'เพิ่ม lotto 100 ชุด',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                  const Text(
                    'สำเร็จ',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิด Dialog
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 230, 92, 87)),
                ),
                child: const Center(
                    child: Text(
                  'ตกลง',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              )
            ],
          ),
        );
      } else {
        log('Failed to insert lotto: ${response.body}');
      }
    } catch (err) {
      log('Error inserting lotto: $err');
    }
  }

  Future<void> reset() async {
    try {
      var config = await Configuration.getConfig();
      var url = config['apiEndpoint'];

      var response = await http.delete(Uri.parse('$url/draw/ResetSystem'));

      if (response.statusCode == 200) {
        // Assuming `data` contains the lotto results.
        setState(() {
          var data = jsonDecode(response.body);
          log(jsonEncode(data));
        });
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
                  const Text(
                    'ลบข้อมูลทั้งระบบ',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                  const Text(
                    'เสร็จสิ้น',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิด Dialog
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 240, 192, 48)),
                ),
                child: const Center(
                    child: Text(
                  'ตกลง',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              )
            ],
          ),
        );
      } else {
        log('Failed to insert lotto: ${response.body}');
      }
    } catch (err) {
      log('Error inserting lotto: $err');
    }
  }

  Future<GetsalesdataResponseGet> fetchSalesData() async {
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];

    try {
    final response = await http.get(Uri.parse('$url/sales/GetSalesData'));

    if (response.statusCode == 200) {
      return getsalesdataResponseGetFromJson(response.body);
    } else {
      log('Failed to load sales data: ${response.statusCode}');
      throw Exception('Failed to load sales data');
    }
  } catch (e) {
    log('Error fetching sales data: $e');
    rethrow;
  }
  }
}
