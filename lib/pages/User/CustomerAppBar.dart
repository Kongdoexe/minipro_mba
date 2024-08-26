import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size screenSize;

  const CustomAppBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/ICON.png",
                width: screenSize.width * 0.12,
                height: screenSize.height * 0.08, // ปรับขนาดตามที่ต้องการ
              ),
              const SizedBox(width: 8),
              const Text(
                "ตรวจสลาก",
                style: TextStyle(
                  fontFamily: 'MaliBold',
                  color: Colors.white,
                  fontSize: 18,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
