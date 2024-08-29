import 'package:flutter/material.dart';
import 'package:minipro_mba/pages/Register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  padding: EdgeInsets.only(right: 200, top: 40),
                  child: Text(
                    'ชื่อผู้ใช้/อีเมลล์',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 10),
                  child: TextField(
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
                  )),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 240, top: 30),
                  child: Text(
                    'รหัสผ่าน',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 10),
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 1,
                    )),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(243, 134, 134, 1),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    width: 150,
                    height: 40,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text('เข้าสู่ระบบ'),
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
                      padding: EdgeInsets.only(top: 10),
                      child: Text('คุณยังไม่มีบัญชีใช่หรือไม่ ?'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 9),
                      child: TextButton(
                          onPressed: register,
                          child: const Text(
                            'สมัครสมาชิก',
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

  void register() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register(),
        ));
  }
}
