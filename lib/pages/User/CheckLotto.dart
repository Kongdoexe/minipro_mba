import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Make sure to include this package if you want to use Iconsax icons

class CheckLottoPage extends StatefulWidget {
  const CheckLottoPage({super.key});

  @override
  State<CheckLottoPage> createState() => _CheckLottoPageState();
}

class _CheckLottoPageState extends State<CheckLottoPage> {
  TextEditingController Test = TextEditingController(text: "รอบที่ 1");
  int i = 1;

  @override
  Widget build(BuildContext context) {
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
                const Text("ตรวจสลาก"),
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
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                    topRight: Radius.circular(120),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 60,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 70, right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "เลือกรอบที่ออกรางวัล",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      controller: Test,
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
                      padding: const EdgeInsets.only(top: 80, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("กรอกหมายเลขสลาก",
                              style: TextStyle(fontSize: 20)),
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ...List.generate(i, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'หมายเลขสลาก ${index + 1}',
                                        suffixIcon: IconButton(
                                          icon:
                                              const Icon(Icons.close_outlined),
                                          onPressed: deleteRecode,
                                        ),
                                        border: const OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  if (index == i - 1) ...[
                                    const Padding(
                                        padding: EdgeInsets.only(right: 10)),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      style: IconButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            255, 59, 48, 1),
                                      ),
                                      onPressed: AddRecord,
                                    )
                                  ]
                                ],
                              ),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.only(top: 80, left: 20),
                            child: Center(
                              child: FilledButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(
                                          0xFFFFD180)), // Set background color
                                ),
                                child: const Text(
                                  "ตรวจสลาก",
                                  style: TextStyle(fontSize: 20, color: Colors.black),
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
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.white, fontSize: 14),
            ),
            iconTheme: const MaterialStatePropertyAll(IconThemeData(size: 30))),
        child: NavigationBar(
          backgroundColor: const Color.fromRGBO(249, 85, 85, 1),
          selectedIndex: 1,
          onDestinationSelected: (value) => 1,
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

  void AddRecord() {
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
