import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/EditProfile.dart';
import 'package:minipro_mba/pages/User/Wallet_topup.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final userModel = context.watch<Data>(); // ใช้ context.watch สำหรับการรีเฟรช
    

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'โปรไฟล์',
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
                          borderRadius: BorderRadius.circular(screenSize.width * 0.05),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: screenSize.width * 0.8,
                              height: screenSize.height * 0.27,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: screenSize.height * 0.12),
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
                                    padding: EdgeInsets.all(screenSize.width * 0.03),
                                    child: FilledButton(
                                        onPressed: editpro,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(255, 233, 119, 119),
                                        ),
                                        child: const Text(
                                          'แก้ไขโปรไฟล์',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'MaliMedium',
                                              fontWeight: FontWeight.w600),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height * 0.02),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 213, 213),
                            borderRadius: BorderRadius.circular(screenSize.width * 0.05),
                          ),
                          child: SizedBox(
                            width: screenSize.width * 0.8,
                            height: screenSize.height * 0.38,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
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
                                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 235, 131, 131),
                                      borderRadius: BorderRadius.circular(screenSize.width * 0.05),
                                    ),
                                    child: SizedBox(
                                      width: screenSize.width * 0.55,
                                      height: screenSize.height * 0.12,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: screenSize.height * 0.01),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/money-bag.png',
                                                    width: screenSize.width * 0.08,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: screenSize.width * 0.05),
                                                    child: Text(
                                                      '฿ ${userModel. datauser.wallet}',
                                                      style: const TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w700),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                          const Text(
                                            'ยอดเงินคงเหลือ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily: 'MaliMedium',
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
                                  child: TextButton(
                                      onPressed: walletpop,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/wallet.png',
                                            width: screenSize.width * 0.13,
                                          ),
                                          SizedBox(height: screenSize.height * 0.01),
                                          const Text(
                                            'เติมเงินเข้าวอเล็ท',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily: 'MaliMedium',
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )),
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
            bottom: screenSize.height * 0.59,
            right: screenSize.width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(screenSize.width * 0.4),
              child: Image.asset(
                'assets/images/user-avatar.png',
                width: screenSize.width * 0.5,
                height: screenSize.width * 0.4,
                fit: BoxFit.cover,
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

  void walletpop() async {
    // Navigates to WalletTopUpPage and waits until it returns
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WalletTopUpPage(),
      ),
    );
  }

  void editpro() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditprofilePage(),
      ),
    );
  }
}
