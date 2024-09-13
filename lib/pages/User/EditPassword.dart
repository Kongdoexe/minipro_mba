import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/changepassword_request_put.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/EditProfile.dart';
import 'package:minipro_mba/pages/User/Profile.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({super.key});

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  bool _isPasswordVisiblePassword = false;
  bool _isPasswordVisibleNewPassword = false;
  bool _isPasswordVisibleNewConfirm = false;
  TextEditingController _password = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _newConfirm = TextEditingController();
  final myWidget = MyWidget();
  final handleError = HandleError();

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
              bottom: screenSize.height * 0.064,
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
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: const Text('รหัสผ่านเดิม'),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        TextField(
                          controller: _password,
                          obscureText: !_isPasswordVisiblePassword,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 247, 127, 118),
                                width: 2,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisiblePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisiblePassword =
                                      !_isPasswordVisiblePassword;
                                });
                              },
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
                          controller: _newPassword,
                          obscureText: !_isPasswordVisibleNewPassword,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 247, 127, 118),
                                width: 2,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisibleNewPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisibleNewPassword =
                                      !_isPasswordVisibleNewPassword;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: const Text('ยืนยันรหัสผ่านใหม่'),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        TextField(
                          controller: _newConfirm,
                          obscureText: !_isPasswordVisibleNewConfirm,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 247, 127, 118),
                                width: 2,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisibleNewConfirm
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisibleNewConfirm =
                                      !_isPasswordVisibleNewConfirm;
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: backtoEditProfile,
                              child: const Text(
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
                        onPressed: _editPassword,
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

  Future<String> loadUrl() async {
    var value = await Configuration.getConfig();
    return value['apiEndpoint'];
  }

  Future<void> _editPassword() async {
    try {
      if (_password.text.isNotEmpty &&
          _newPassword.text.isNotEmpty &&
          _newConfirm.text.isNotEmpty) {
        if (_newPassword.text == _newConfirm.text) {
          final url = await loadUrl();
          final data = context.read<Data>();
          var body = ChangepasswordRequestPut(
              oldPassword: _password.text, newPassword: _newPassword.text);
          var jsonBody = changepasswordRequestPutToJson(body);

          var response = await http.put(
              Uri.parse("$url/auth/ChangePassword/${data.datauser.memberId}"),
              headers: {"Content-Type": "application/json; charset=utf-8"},
              body: jsonBody);

          if (response.statusCode == 200) {
            myWidget.showCustomSnackbar(
                "Success", "Password updated successfully");
            _showDialogSuccess();
          } else {
            handleError.handleError(response);
          }
        } else {
          myWidget.showCustomSnackbar(
              "Error", "รหัสผ่านใหม่กับยืนยันรหัสผ่านไม่เหมือนกัน");
        }
      } else {
        myWidget.showCustomSnackbar("Error", "กรุณากรอกข้อมูลให้ครบทุกช่อง");
      }
    } catch (e) {
      myWidget.showCustomSnackbar("Error", e.toString());
    }
  }

  void _showDialogSuccess() {
    final screenSize = MediaQuery.of(context).size;
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
              Text(
                'เปลี่ยนรหัสผ่านสำเร็จ',
                style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: screenSize.width * 0.06),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: screenSize.width * 0.4,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 230, 92, 87)),
                ),
                child: Text(
                  'ตกลง',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
