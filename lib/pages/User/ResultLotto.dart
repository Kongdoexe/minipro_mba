import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ResultLottoPage extends StatefulWidget {
  const ResultLottoPage({super.key});

  @override
  State<ResultLottoPage> createState() => _ResultLottoPageState();
}

class _ResultLottoPageState extends State<ResultLottoPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<bool> results = [false, true, true];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

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
                  width: screenSize.width * 0.12,
                  height: screenSize.height * 1,
                ),
                const Text(
                  "ตรวจสลาก",
                  style: TextStyle(
                      fontFamily: 'MaliBold',
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: screenSize.width * 0.12,
              height: screenSize.height * 1,
              child: PopupMenuButton<int>(
                icon: Icon(
                  Icons.menu,
                  size: screenSize.height * 0.04,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                offset: Offset(screenSize.width * -0.02,
                    screenSize.height * 0.515), //position
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Iconsax.shopping_cart, color: Colors.black),
                        SizedBox(width: screenSize.width * 0.05),
                        const Text('ตระกร้า'),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Iconsax.logout, color: Colors.black),
                        SizedBox(width: screenSize.width * 0.05),
                        const Text('ออกจากระบบ'),
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
              padding: EdgeInsets.only(
                right: screenSize.width * 0.08,
                left: screenSize.width * 0.08,
                bottom: screenSize.height * 0.12,
                top: screenSize.height * 0.10,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.height * 0.032),
                        child: PageView(
                          controller: _pageController,
                          children: results
                              .map((result) => result
                                  ? buildTrueWidget()
                                  : buildFalseWidget())
                              .toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: screenSize.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(results.length, (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.014),
                            width: screenSize.width * 0.025,
                            height: screenSize.height * 0.025,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? const Color.fromARGB(255, 0, 0, 0)
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "ผลการตรวจรางวัล",
                        style: TextStyle(
                            fontFamily: 'MaliMedium',
                            fontSize: screenSize.width * 0.05,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.66,
                ),
                SizedBox(
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.05,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(255, 209, 128, 1)),
                    child: Text(
                      "รับรางวัล",
                      style: TextStyle(
                          fontFamily: 'MaliMedium',
                          fontSize: screenSize.width * 0.036,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
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

  Widget buildTrueWidget() {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenSize.width * 2.0,
            child: Image.asset(
              "assets/images/Cheap.png",
              height: screenSize.height * 0.31,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.005),
          ),
          Text(
            "451238",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.06,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "งวดประจำรอบที่ 1",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: screenSize.height * 0.015),
          Text(
            "ถูกรางวัลที่ 1",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.044,
              color: const Color.fromRGBO(213, 11, 0, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            "เงินรางวัล",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Text(
            "6,000,000",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.05,
              color: const Color.fromRGBO(213, 11, 0, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            "บาท",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFalseWidget() {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: screenSize.width * 2,
              child: Image.asset(
                "assets/images/Not_cheap.png",
                height: screenSize.height * 0.31,
                fit: BoxFit.contain,
              )),
          SizedBox(height: screenSize.height * 0.02),
          Text(
            "451238",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.065,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          Text(
            "งวดประจำรอบที่ 1",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Text(
            "ไม่ถูกรางวัล",
            style: TextStyle(
              fontFamily: 'MaliBold',
              fontSize: screenSize.width * 0.046,
              color: const Color.fromRGBO(213, 11, 0, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            "ครั้งนี้ไม่ถูกครั้งหน้า",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Text(
            "เราเอาใหชีวิตยังอีกยาวไกลยิ่งนักเจ้าขา",
            style: TextStyle(
              fontFamily: 'MaliMedium',
              fontSize: screenSize.width * 0.036,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
