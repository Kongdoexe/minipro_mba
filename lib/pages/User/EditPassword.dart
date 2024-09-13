import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/EditProfile.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({super.key});

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'เปลี่ยนรหัสผ่าน',
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
                        Text('อีเมลล์'),
                        SizedBox(height: screenSize.height * 0.015),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenSize.width * 0.01,
                              horizontal: 10,
                            ),
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
                          child: const Text('รหัสผ่านเดิม'),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        TextField(
                          obscureText: true, // ซ่อนรหัสผ่าน
                          decoration: const InputDecoration(
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
                          child: const Text('รหัสผ่านใหม่'),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        TextField(
                          obscureText: true, // ซ่อนรหัสผ่าน
                          maxLength: 10,
                          decoration: const InputDecoration(
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
                              onPressed: backtoEditProfile,
                              child: Text(
                                'ย้อนกลับ',
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

  void backtoEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfilePage()),
    );
  }
}
