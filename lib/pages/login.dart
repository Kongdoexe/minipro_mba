import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/login_request_get.dart';
import 'package:minipro_mba/models/response/login_response_get.dart';
import 'package:minipro_mba/pages/Admin/HomePage.dart';
import 'package:minipro_mba/pages/Register.dart';
import 'package:http/http.dart' as http;
import 'package:minipro_mba/pages/User/HomePageuser.dart';
import 'dart:convert';
import 'dart:developer';

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

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (value) {
        print('Configuration loaded: $value'); // ตรวจสอบค่าที่โหลด
        url = value['apiEndpoint'].toString();
      },
    ).catchError((err) {
      print('Error in initState: $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(0, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ICON.png',
                      width: 180,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    'LOTTO APP',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(243, 134, 134, 1)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 230, top: 40),
                  child: Text(
                    'อีเมลล์',
                    style: TextStyle(fontWeight: FontWeight.w700,fontSize:17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
                  child: TextField(
                    controller:
                        _emailController, // เชื่อมโยง controller กับ TextField
                    decoration: InputDecoration(
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
                const Padding(
                  padding: EdgeInsets.only(right: 220, top: 30),
                  child: Text(
                    'รหัสผ่าน',
                    style: TextStyle(fontWeight: FontWeight.w700,fontSize:17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
                  child: TextField(
                    controller:
                        _passwordController, // เชื่อมโยง controller กับ TextField
                    obscureText: true, // ซ่อนรหัสผ่านเมื่อป้อน
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 1,
                      )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(243, 134, 134, 1),
                            width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    width: 150,
                    height: 40,
                    child: FilledButton(
                      onPressed: () {
                        loginUser();
                      },
                      child: Text('เข้าสู่ระบบ',style: TextStyle(fontSize:16),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 230, 92, 87)),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('คุณยังไม่มีบัญชีใช่หรือไม่ ?',style: TextStyle(fontSize:16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextButton(
                        onPressed: register,
                        child: const Text(
                          'สมัครสมาชิก',
                          style:
                              TextStyle(color: Color.fromRGBO(221, 86, 76, 1),fontSize: 16)
                              ,
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
        builder: (context) => Register(),
      ),
    );
  }

  void loginUser() {
    LoginRequestGet login = LoginRequestGet(
        email: _emailController.text, password: _passwordController.text);

    if (url.isEmpty) {
      print('Error: API URL is empty');
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

          Map<String, dynamic> responseData = jsonDecode(response.body);

          LoginResponseGet memberlogin =
              LoginResponseGet.fromJson(responseData);

          print('เข้าสู่ระบบสำเร็จ');

          // ตรวจสอบค่า isadmin
          if (memberlogin.isadmin == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Homepageuser(
                  mid: memberlogin.memberId,
                ),
              ),
            );
            print('id=${memberlogin.memberId}');
          } else if (memberlogin.isadmin == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                    ),
              ),
            );
          } else {
            print('Error: Unexpected isadmin value');
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Unexpected isadmin value')));
          }
        } catch (e) {
          print('Error parsing JSON: $e');
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to parse server response')));
        }
      } else {
        // กรณีที่การตอบสนองไม่ถูกต้อง
        print('Error: Login failed with status code ${response.statusCode}');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login failed')));
      }
    }).catchError((error) {
     
    });
  }
}
