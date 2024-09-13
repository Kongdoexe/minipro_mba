import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/login_request_get.dart';
import 'package:minipro_mba/models/response/login_response_get.dart';
import 'package:minipro_mba/pages/Admin/HomePage.dart';
import 'package:minipro_mba/pages/Register.dart';
import 'package:http/http.dart' as http;
import 'package:minipro_mba/pages/User/HomePageuser.dart';

import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String url = "";

  // สร้าง TextEditingController สำหรับจัดการอินพุตอีเมลและรหัสผ่าน
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final myWidget = MyWidget();
  final handleError = HandleError();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (value) {
        // showCustomSnackbar("Message", 'Configuration loaded $value');
        url = value['apiEndpoint'].toString();
      },
    ).catchError((err) {
      myWidget.showCustomSnackbar("Message", 'Error in initState: $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    // ใช้ MediaQuery เพื่อรับขนาดหน้าจอ
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(0, 255, 255, 255),
          child: Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ICON.png',
                      width: screenSize.width * 0.4,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.03),
                  child: Text(
                    'LOTTO APP',
                    style: TextStyle(
                        fontSize: screenSize.width * 0.05,
                        fontWeight: FontWeight.w900,
                        color: const Color.fromRGBO(243, 134, 134, 1)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: screenSize.width * 0.6,
                      top: screenSize.height * 0.03),
                  child: Text(
                    'อีเมลล์',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: screenSize.width * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.15,
                      right: screenSize.width * 0.15,
                      top: screenSize.height * 0.02),
                  child: TextField(
                    controller:
                        _emailController, // เชื่อมโยง controller กับ TextField
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 1,
                      )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 247, 127, 118),
                            width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 230, top: screenSize.height * 0.03),
                  child: Text(
                    'รหัสผ่าน',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: screenSize.width * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.15,
                      right: screenSize.width * 0.15,
                      top: screenSize.height * 0.02),
                  child: TextField(
                    controller: _passwordController,
                    obscureText:
                        !_isPasswordVisible, // Toggle password visibility
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(243, 134, 134, 1), width: 2),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.05),
                  child: SizedBox(
                    width: screenSize.width * 0.4, // ใช้ความกว้างของหน้าจอ 40%
                    height: screenSize.height * 0.06, // ใช้ความสูงของหน้าจอ 6%
                    child: FilledButton(
                      onPressed: () {
                        loginUser();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color.fromARGB(255, 230, 92, 87)),
                      ),
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(fontSize: screenSize.width * 0.04),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.02),
                      child: Text(
                        'คุณยังไม่มีบัญชีใช่หรือไม่ ?',
                        style: TextStyle(fontSize: screenSize.width * 0.04),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.02),
                      child: TextButton(
                        onPressed: register,
                        child: Text(
                          'สมัครสมาชิก',
                          style: TextStyle(
                              color: const Color.fromRGBO(221, 86, 76, 1),
                              fontSize: screenSize.width * 0.04),
                        ),
                      ),
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

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Register(),
      ),
    );
  }

  void loginUser() {
    final userTest = context.read<Data>();
    LoginRequestGet login = LoginRequestGet(
        email: _emailController.text, password: _passwordController.text);

    if (url.isEmpty) {
      myWidget.showCustomSnackbar('Message', 'Error: API URL is empty');
      return;
    }

    http
        .post(
      Uri.parse('$url/auth/Login'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
      body: loginRequestGetToJson(login),
    )
        .then((response) {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        try {
          LoginResponseGet memberlogin =
              loginResponseGetFromJson(response.body);
          userTest.setDataUser(memberlogin.member);
          userTest.setPeriod(memberlogin.periodLotto);
          userTest.setLastperiod(memberlogin.periodLotto);

          // ตรวจสอบค่า isadmin
          if (memberlogin.member.isadmin == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Homepageuser(),
              ),
            );
            // print('id=${memberlogin.memberId}');
          } else if (memberlogin.member.isadmin == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else {
            myWidget.showCustomSnackbar("Message", "Unexpected isadmin value");
          }
        } catch (e) {
          handleError.handleError(response);
        }
      } else {
        handleError.handleError(response);
      }
    }).catchError((error) {
      myWidget.showCustomSnackbar(
          "Message", "An error occurred during login $error");
    });
  }
}
