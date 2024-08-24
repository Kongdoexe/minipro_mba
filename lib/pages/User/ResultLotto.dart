import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ResultLottoPage extends StatefulWidget {
  const ResultLottoPage({super.key});

  @override
  State<ResultLottoPage> createState() => _ResultLottoPageState();
}

class _ResultLottoPageState extends State<ResultLottoPage> {
  bool myBooleanCondition = false;

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
              padding: const EdgeInsets.only(
                right: 62,
                left: 62,
                bottom: 62,
                top: 42,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(70),
              child: myBooleanCondition ? buildTrueWidget() : buildFalseWidget(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white, fontSize: 14),
          ),
          iconTheme: const MaterialStatePropertyAll(
            IconThemeData(size: 30),
          ),
        ),
        child: NavigationBar(
          backgroundColor: const Color.fromRGBO(249, 85, 85, 1),
          selectedIndex: 1,
          onDestinationSelected: (value) => 1,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "หน้าแรก"),
            NavigationDestination(icon: Icon(Iconsax.wallet_check), label: "ตรวจสลาก"),
            NavigationDestination(icon: Icon(Iconsax.ticket), label: "สลากของฉัน"),
            NavigationDestination(icon: Icon(Iconsax.money_tick), label: "ซื้อสลาก"),
            NavigationDestination(icon: Icon(Iconsax.profile_2user), label: "โปรไฟล์"),
          ],
        ),
      ),
    );
  }

  Widget buildTrueWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/Cheap.png"),
        const Padding(padding: EdgeInsets.only(top: 10),),
        const Text(
          "451238",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          "งวดประจำรอบที่ 1",
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 20),
        const Text(
          "ถูกรางวัลที่ 1",
          style: TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(213, 11, 0, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "เงินรางวัล",
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
        const Text(
          "6,000,000",
          style: TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(213, 11, 0, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "บาท",
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
        FilledButton(
          onPressed: () {},
          child: const Text("ขึ้นเงิน"),
        ),
      ],
    );
  }

  Widget buildFalseWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/Not_cheap.png"),
        const SizedBox(height: 20),
        const Text(
          "451238",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          "งวดประจำรอบที่ 1",
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 20),
        const Text(
          "ไม่ถูกรางวัล",
          style: TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(213, 11, 0, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text("ครั้งนี้ไม่ถูกครั้งหน้าเราเอาใหม่ ชีวิตยังอีกยาวไกลยิ่งนักเจ้าขา", textAlign: TextAlign.center,style: TextStyle(fontSize: 14),),
        const SizedBox(height: 10),
        FilledButton(
          onPressed: () {},
          child: const Text("ตกลง"),
        ),
      ],
    );
  }
}
