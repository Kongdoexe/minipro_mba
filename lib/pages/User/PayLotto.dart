import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PaylottoPage extends StatefulWidget {
  const PaylottoPage({super.key});

  @override
  State<PaylottoPage> createState() => _PaylottoPageState();
}

class _PaylottoPageState extends State<PaylottoPage> {
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
      body: Container(

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
}