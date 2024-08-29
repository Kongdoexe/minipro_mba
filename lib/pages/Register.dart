import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/pages/login.dart';
import 'package:http/http.dart' as http;

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
  String url ='';
  
  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then((value) {
      url=value['apiEndpoint'].toString();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 160, 154, 1),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/ICON.png',
                height: 60,
              ),
              SizedBox(width: 5), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
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
          color: Color.fromARGB(0, 0, 0, 0),
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ชื่อ-สกุล : '),
                SizedBox(height: 10),
                 TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text('อีเมลล์ : '),
                ),
                SizedBox(height: 10),
                 TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text('เบอร์โทรศัพท์ : '),
                ),
                SizedBox(height: 10),
                 TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text('รหัสผ่าน : '),
                ),
                SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text('จำนวนเงินในวอลเล็ท : '),
                ),
                SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 127, 118),
                          width: 2), // เปลี่ยนขอบเป็นสีแดงเมื่อคลิก
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                      child: FilledButton(
                    onPressed: regissuccess,
                    child: Text('สมัครสมาชิก'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 230, 92, 87)),
                    ),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('คุณมีบัญชีอยู่แล้ว ?'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 9),
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

  void regissuccess() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 245, 156, 55),
        title:  Center(
          child:  Column(
            children: [
              Image.asset('assets/images/check.png',
                width: 70,
              ),
              const Text(
                'สมัครสมาชิก',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w800,
                  fontSize: 30
                ),
              ),
              const Text(
                'สำเร็จ',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w800,
                  fontSize: 30
                ),
              ),
            ],
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Center(child: const Text('ตกลง',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            )),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 230, 92, 87)),
            ),
          )
        ],
      ),
    );
  }

  void gologin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
