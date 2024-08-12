import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
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
                  color: Color.fromRGBO(255, 255, 255, 2)
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(0, 0, 0, 0),
      ),
    );
  }
}
