import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/pages/User/PayLotto.dart';

class CartlottoPage extends StatefulWidget {
  const CartlottoPage({super.key});

  @override
  State<CartlottoPage> createState() => _CartlottoPageState();
}

class _CartlottoPageState extends State<CartlottoPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/ICON.png",
                  width: 50,
                  height: 50,
                ),
                const Text("ซื้อสลาก"),
              ],
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: PopupMenuButton<int>(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                offset: const Offset(-5, 30), //position
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Iconsax.shopping_cart, color: Colors.black),
                        SizedBox(width: 10),
                        Text('ตระกร้า'),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Iconsax.logout, color: Colors.black),
                        SizedBox(width: 10),
                        Text('ออกจากระบบ'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          // Main content
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ตรวจสอบรายการสลาก',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  children: [
                    Text('สลาก 1 ใบ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text('งวดวันที่ 1 กันยายน 2567'),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: screenSize.width,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: choosemore,
                                  child: const Text(
                                    'เลือกเลขเพิ่ม',
                                    style: TextStyle(
                                        color: Color.fromRGBO(221, 86, 76, 1)),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                child: Column(
                                  children: [
                                    Card.outlined(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: SizedBox(
                                                        width:
                                                            150, // Card width
                                                        height:
                                                            50, // Card height
                                                        child: Card(
                                                          color: Color.fromARGB(
                                                              255,
                                                              186,
                                                              186,
                                                              186),
                                                          child: Center(
                                                              child: Text(
                                                            '123456',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ),
                                                      )),
                                                  Text('งวดที่'),
                                                  Text('64'),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: OutlinedButton(
                                                      onPressed: delete,
                                                      child: Text('เอาออก',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        side: const BorderSide(
                                                            color: Color.fromARGB(
                                                                255,
                                                                240,
                                                                8,
                                                                8)), // Border color
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text('80 บาท'),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
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
                  ),
                ),
              ),
            ],
          ),

          // Positioned card over the navigation bar
          Positioned(
            bottom: 0, // Adjust as needed
            left: 0,
            right: 0,
            child: Card.outlined(
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    const Text(
                      'ยอดชำระทั้งหมด',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '80 บาท',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: pay,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 85, 85, 1),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text(
                          'ชำระเงิน',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: Colors.white, fontSize: screenSize.width * 0.034),
          ),
          iconTheme: WidgetStatePropertyAll(
            IconThemeData(size: screenSize.width * 0.068),
          ),
        ),
        child: NavigationBar(
          backgroundColor: const Color.fromRGBO(249, 85, 85, 1),
          selectedIndex: 3,
          onDestinationSelected: (value) => 3,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "หน้าแรก"),
            NavigationDestination(
                icon: Icon(Iconsax.wallet_check), label: "ตรวจสลาก"),
            NavigationDestination(
                icon: Icon(Iconsax.ticket), label: "สลากของฉัน"),
            NavigationDestination(
                icon: Icon(Iconsax.money_tick), label: "ซื้อสลาก"),
            NavigationDestination(
                icon: Icon(Iconsax.profile_2user), label: "โปรไฟล์"),
          ],
        ),
      ),
    );
  }

  void delete() {
    // Implement delete functionality
  }

  void choosemore() {
  }

  void pay() {
     Navigator.push(context,
    MaterialPageRoute(builder: (context) => const PaylottoPage(),
    ));
  }
}
