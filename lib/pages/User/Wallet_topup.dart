import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/addfunds_request_put.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/EditProfile.dart';
import 'package:minipro_mba/pages/User/HomePageuser.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class WalletTopUpPage extends StatefulWidget {
  const WalletTopUpPage({super.key});

  @override
  State<WalletTopUpPage> createState() => _WalletTopUpPageState();
}

class _WalletTopUpPageState extends State<WalletTopUpPage> {
  TextEditingController inputnum = TextEditingController();
  final myWidget = MyWidget();
  final handleError = HandleError();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final userModel = context.watch<Data>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'โปรไฟล์',
      ),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
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
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenSize.height * 0.1),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.05),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: screenSize.width * 0.8,
                                height: screenSize.height * 0.27,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: screenSize.height * 0.12),
                                      child: Text(
                                        userModel.datauser.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'MaliMedium',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          screenSize.width * 0.03),
                                      child: FilledButton(
                                        onPressed: goEditProfile,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 233, 119, 119),
                                        ),
                                        child: const Text(
                                          'แก้ไขโปรไฟล์',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'MaliMedium',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 213, 213),
                              borderRadius: BorderRadius.circular(
                                  screenSize.width * 0.05),
                            ),
                            child: SizedBox(
                              width: screenSize.width * 0.8,
                              height: screenSize.height * 0.38,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height * 0.02),
                                    child: const Text(
                                      'Wallet',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: 'MaliMedium',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height * 0.02),
                                    child: Image.asset(
                                      "assets/images/paywallet.png",
                                      width: screenSize.width * 0.16,
                                      height: screenSize.height * 0.09,
                                    ),
                                  ),
                                  const Text(
                                    "เติมเงินเข้าวอลเล็ท",
                                    style: TextStyle(
                                      fontFamily: 'MaliMedium',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height * 0.01),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: screenSize.width * 0.06),
                                      child: TextField(
                                        controller: inputnum,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "กรุณากรอกจำนวนเงิน",
                                          hintStyle: TextStyle(
                                            fontFamily: 'MaliMedium',
                                            fontSize: screenSize.width * 0.035,
                                            color: Colors.grey,
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height * 0.01),
                                    child: SizedBox(
                                      width: screenSize.width * 0.37,
                                      child: TextButton(
                                        onPressed: addCost,
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            const Color.fromRGBO(
                                                255, 149, 0, 1),
                                          ),
                                        ),
                                        child: Text(
                                          "ยืนยันการเติมเงิน",
                                          style: TextStyle(
                                            fontFamily: 'MaliMedium',
                                            fontSize: screenSize.width * 0.032,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: screenSize.height * 0.56,
              right: screenSize.width * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenSize.width * 0.4),
                child: Image.asset(
                  'assets/images/user-avatar.png',
                  width: screenSize.width * 0.5,
                  height: screenSize.width * 0.38,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 4,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  Future<String> loadUrl() async {
    final value = await Configuration.getConfig();
    return value['apiEndpoint'];
  }

  void goEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfilePage()),
    );
  }

  Future<void> addCost() async {
    try {
      final url = await loadUrl();
      final member = context.read<Data>();

      int gratuity;
      try {
        gratuity = int.parse(inputnum.text);
      } catch (e) {
        gratuity = 0;
      }
      var body = AddfundsRequestPut(gratuity: gratuity);
      final jsonData = addfundsRequestPutToJson(body);

      var response = await http.put(
        Uri.parse('$url/wallet/AddFunds/${member.datauser.memberId}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonData,
      );

      if (response.statusCode == 200) {
        handleError.handleError(response);
        _topUpWallet(gratuity.toDouble());
        _navigateToHomeWithDelay();
      } else {
        handleError.handleError(response);
      }
    } catch (e) {
      myWidget.showCustomSnackbar("Message", 'An error occurred: $e');
    }
  }

  void _topUpWallet(double amount) {
    final dataModel = context.read<Data>();
    dataModel.updateWallet(dataModel.datauser.wallet + amount);
  }
  
  void _navigateToHomeWithDelay() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepageuser()),
      );
    });
  }
}
