import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/EditProfile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'แก้ไขโปรไฟล์',
      ),
      resizeToAvoidBottomInset: false, // ป้องกันการเลื่อนเมื่อแป้นพิมพ์เปิด
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.1,
              left: screenSize.width * 0.1,
              right: screenSize.width * 0.1,
              bottom: screenSize.height * 0.05,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(screenSize.width * 0.05),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.1,
                      left: screenSize.width * 0.05,
                      right: screenSize.width * 0.05,
                      bottom: screenSize.width * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ชื่อ-สกุล'),
                        SizedBox(height: screenSize.height * 0.015),
                        TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenSize.width * 0.01,
                              horizontal: 10,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 247, 127, 118),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: const Text('อีเมลล์'),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        const TextField(
                          obscureText: true, // ซ่อนรหัสผ่าน
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 247, 127, 118),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: const Text('เบอร์โทรศัพท์'),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        const TextField(
                          obscureText: true, // ซ่อนรหัสผ่าน
                          maxLength: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 247, 127, 118),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'เปลี่ยนรหัสผ่าน ?',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'ลบบัญชี',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenSize.height * 0.05),
                    child: SizedBox(
                      width: screenSize.width * 0.3,
                      height: screenSize.height * 0.05,
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 230, 92, 87),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'ยืนยัน',
                          style: TextStyle(fontSize: screenSize.width * 0.04),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.6,
            left: screenSize.width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(screenSize.width * 0.4),
              child: Image.asset(
                'assets/images/user-avatar.png',
                width: screenSize.width * 0.5,
                height: screenSize.width * 0.4,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 4,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }
}
