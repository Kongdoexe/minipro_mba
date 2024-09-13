import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:minipro_mba/pages/Admin/HomePage.dart';
import 'package:minipro_mba/pages/User/EditPassword.dart'; // เปลี่ยนจาก EditProfile เป็น EditPassword
import 'package:minipro_mba/pages/User/EditProfile.dart';
import 'package:minipro_mba/pages/User/HomePageuser.dart';
import 'package:minipro_mba/pages/User/Wallet_topup.dart';
import 'package:minipro_mba/pages/login.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => Data(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          const EditPasswordPage(), // เปลี่ยนจาก EditProfilePage เป็น EditPasswordPage
    );
  }
}
