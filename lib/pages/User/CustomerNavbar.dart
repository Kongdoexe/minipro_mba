import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/pages/User/ChooseLotto.dart';
import 'package:minipro_mba/pages/User/CheckLotto.dart';
import 'package:minipro_mba/pages/User/HomePageuser.dart';
import 'package:minipro_mba/pages/User/MyLotto.dart';
import 'package:minipro_mba/pages/User/Profile.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final Size screenSize;

  const CustomNavigationBar({
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
          backgroundColor: const Color.fromRGBO(249, 85, 85, 1),
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
              case 2:
                navigateMyLotto(context);
                break;
              case 3:
                navigateBuyLotto(context);
                break;
              case 4:
                navigateProfile(context);
                break;
            }
          },
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

  void navigateHomePage(BuildContext context) {
    _setperiod(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepageuser()),
    );
  }

  void navigateCheckLotto(BuildContext context) {
    _setperiod(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CheckLottoPage()),
    );
  }

  void navigateMyLotto(BuildContext context) {
    _setperiod(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyLottoPage()),
    );
  }

  void navigateBuyLotto(BuildContext context) {
    _setperiod(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooselottoPage()),
    );
  }

  void navigateProfile(BuildContext context) {
    _setperiod(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  void _setperiod(BuildContext context) {
    final memberId = context.read<Data>();
    memberId.setPeriod(memberId.lastperiod);
  }
}
