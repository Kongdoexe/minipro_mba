import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/pages/User/CartLotto.dart';
import 'package:minipro_mba/pages/login.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size screenSize;
  final String namePage;

  const CustomAppBar({
    super.key,
    required this.screenSize,
    required this.namePage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/ICON.png",
                width: screenSize.width * 0.12,
                height: screenSize.height * 0.08,
              ),
              SizedBox(width: screenSize.width * 0.01),
              Text(
                namePage,
                style: TextStyle(
                  fontFamily: 'MaliBold',
                  color: Colors.white,
                  fontSize: screenSize.width * 0.052,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: screenSize.width * 0.12,
            child: PopupMenuButton<int>(
              icon: Icon(
                Icons.menu,
                size: screenSize.height * 0.04,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              offset: Offset(
                screenSize.width * -0.02,
                screenSize.height * 0.055,
              ),
              onSelected: (int value) {
                if (value == 0) {
                  navigateCartLotto(context);
                } else if (value == 1) {
                  navigateLoginOut(context);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
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
                  value: 1,
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
          ),
        ],
      ),
    );
  }

  void navigateCartLotto(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartlottoPage()),
    );
  }

  void navigateLoginOut(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
