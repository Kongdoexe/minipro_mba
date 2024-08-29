import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/pages/Admin/HomePage.dart';
import 'package:minipro_mba/pages/Admin/Ramdom.dart';

class Adminnavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final Size screenSize;

  const Adminnavbar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            TextStyle(color: Colors.white, fontSize: screenSize.width * 0.035),
          ),
          iconTheme: WidgetStateProperty.all(
            IconThemeData(size: screenSize.width * 0.07),
          ),
          indicatorColor: Colors.white.withOpacity(0.2),
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: NavigationBar(
          backgroundColor: const Color.fromRGBO(255, 162, 77, 1),
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            onDestinationSelected(index); // Call the passed function

            // Navigate to the corresponding page based on the selected index
            switch (index) {
              case 0:
                navigateHomePage(context);
                break;
              case 1:
                navigateCheckLotto(context);
                break;
            }
          },
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "หน้าแรก"),
            NavigationDestination(icon: Icon(Iconsax.wallet_check), label: "สุ่มออกรางวัล")
          ],
        ),
      ),
    );
  }

  void navigateHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void navigateCheckLotto(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RamdomPage()),
    );
  }
}
