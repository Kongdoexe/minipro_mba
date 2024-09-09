import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/regsiter_request_post.dart';
import 'package:minipro_mba/pages/login.dart';
import 'package:http/http.dart' as http;
import 'package:minipro_mba/share/ShareWidget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController wallet = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String url = '';
  final myWidget = MyWidget();

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (value) {
        url = value['apiEndpoint'].toString();
      },
    ).catchError((err) {
      print('Error in initState: $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 160, 154, 1),
        toolbarHeight: screenSize.height * 0.1,
        title: Padding(
          padding: EdgeInsets.only(left: screenSize.width * 0.08),
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/ICON.png',
                height: screenSize.height * 0.08,
              ),
              SizedBox(width: screenSize.width * 0.01),
              const Text(
                'สมัครสมาชิก',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 2)),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(0, 0, 0, 0),
          child: Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * 0.02,
                left: screenSize.width * 0.12,
                right: screenSize.width * 0.12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('ชื่อ-สกุล : '),
                SizedBox(height: screenSize.height * 0.015),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
                  child: const Text('อีเมลล์ : '),
                ),
                SizedBox(height: screenSize.height * 0.015),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
                  child: const Text('เบอร์โทรศัพท์ : '),
                ),
                SizedBox(height: screenSize.height * 0.015),
                TextField(
                  maxLength: 10,
                  controller: phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
                  child: const Text('รหัสผ่าน : '),
                ),
                SizedBox(height: screenSize.height * 0.015),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
                  child: const Text('ยืนยันรหัสผ่าน : '),
                ),
                SizedBox(height: screenSize.height * 0.015),
                TextField(
                  controller: confirmPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.02),
                  child: const Text('จำนวนเงินในวอลเล็ท : '),
                ),
                SizedBox(height: screenSize.height * 0.015),
                TextField(
                  controller: wallet,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.04),
                  child: Center(
                      child: SizedBox(
                    width: screenSize.width * 0.4,
                    height: screenSize.height * 0.06,
                    child: FilledButton(
                      onPressed: () {
                        regissuccess(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 230, 92, 87)),
                      ),
                      child: Text(
                        'สมัครสมาชิก',
                        style: TextStyle(fontSize: screenSize.width * 0.04),
                      ),
                    ),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.01),
                      child: const Text('คุณมีบัญชีอยู่แล้ว ?'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.01),
                      child: TextButton(
                          onPressed: gologin,
                          child: const Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                                color: Color.fromRGBO(221, 86, 76, 1)),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// ฟังก์ชันการลงทะเบียน
  void regissuccess(BuildContext context) {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty && // ตรวจสอบว่ากรอกยืนยันรหัสผ่านแล้ว
        wallet.text.isNotEmpty) {
      // ตรวจสอบว่ารหัสผ่านตรงกับการยืนยันรหัสผ่าน
      if (password.text != confirmPassword.text) {
        // แสดงข้อความแจ้งเตือนว่ารหัสผ่านไม่ตรงกัน
        myWidget.showCustomSnackbar('Message', 'รหัสผ่านไม่ตรงกัน');
        return; // หยุดการทำงานถ้ารหัสผ่านไม่ตรงกัน
      }

      // สร้างข้อมูลการลงทะเบียน
      RegsiterRequestPost registrationData = RegsiterRequestPost(
          name: name.text,
          email: email.text,
          password: password.text,
          phone: int.parse(phone.text),
          wallet: int.parse(wallet.text),
          isadmin: 0);

      var datauser = regsiterRequestPostToJson(registrationData);
      // ส่งคำขอ POST พร้อมข้อมูลการลงทะเบียน
      http
          .post(
        Uri.parse('$url/auth/Register'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: datauser,
      )
          .then((res) {
        final jsonResponse = json.decode(utf8.decode(res.bodyBytes));
        if (res.statusCode == 200) {
          // ถ้าการลงทะเบียนสำเร็จ
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 245, 156, 55),
              title: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/check.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    const Text(
                      'สมัครสมาชิก',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w800,
                          fontSize: 30),
                    ),
                    const Text(
                      'สำเร็จ',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w800,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
              actions: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // ปิด Dialog
                    gologin(); // เรียกฟังก์ชันเปลี่ยนหน้า
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 230, 92, 87)),
                  ),
                  child: const Center(
                      child: Text(
                    'ตกลง',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  )),
                )
              ],
            ),
          );
        } else {
          // จัดการข้อผิดพลาดหากการลงทะเบียนล้มเหลว
          final msgValue = jsonResponse['msg'];
          myWidget.showCustomSnackbar(
              'Message', 'ลงทะเบียนไม่สำเร็จ: $msgValue');
        }
      }).catchError((error) {
        // จัดการข้อผิดพลาดทางเครือข่ายหรือข้อผิดพลาดอื่น ๆ
        myWidget.showCustomSnackbar('Message', 'เกิดข้อผิดพลาด: $error');
      });
    } else {
      // แสดงข้อความแจ้งเตือนให้กรอกข้อมูลให้ครบ
      myWidget.showCustomSnackbar('Message', 'กรุณากรอกข้อมูลให้ครบถ้วน.');
    }
  }

  void gologin() {
    Navigator.of(context).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
