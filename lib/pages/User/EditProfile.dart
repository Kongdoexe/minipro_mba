import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/updateprofile_request_put.dart';
import 'package:minipro_mba/models/response/login_response_get.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:minipro_mba/pages/User/EditPassword.dart';
import 'package:minipro_mba/pages/User/Profile.dart';
import 'package:minipro_mba/pages/login.dart';
import 'package:minipro_mba/share/ShareData.dart';
import 'package:minipro_mba/share/ShareWidget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController fullnameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  final myWidget = MyWidget();
  final handleError = HandleError();

  @override
  void initState() {
    super.initState();
    final data = context.read<Data>();
    // Set initial values for the text controllers
    fullnameCtl.text = data.datauser.name;
    emailCtl.text = data.datauser.email;
    phoneCtl.text = data.datauser.phone.toString();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'แก้ไขโปรไฟล์',
      ),
      resizeToAvoidBottomInset:
          false, // Prevent layout changes when keyboard opens
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
                          controller: fullnameCtl,
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
                        TextField(
                          controller: emailCtl,
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
                          child: const Text('เบอร์โทรศัพท์'),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        TextField(
                          controller: phoneCtl,
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
                              onPressed: navigatorToEditPassword,
                              child: const Text(
                                'เปลี่ยนรหัสผ่าน ?',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: showDialogDeleteMember,
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
                        onPressed: editProfile,
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

  void navigatorToEditPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditPasswordPage()),
    );
  }

  Future<String> loadUrl() async {
    var value = await Configuration.getConfig();
    return value['apiEndpoint'];
  }

  void showDialogDeleteMember() {
    final screenSize = MediaQuery.of(context).size;
    try {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 34, 34, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: screenSize.height * 0.03),
                  Text(
                    'ยืนยันการลบบัญชี',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w800,
                      fontSize: screenSize.width * 0.06,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close Dialog
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(142, 142, 147, 1)),
                        ),
                        child: Text(
                          'ปิด',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      FilledButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _deleteDialog();
                          _deleteBackend();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 206, 52, 52)),
                        ),
                        child: Text(
                          'ลบ',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      myWidget.showCustomSnackbar("Error", e.toString());
    }
  }

  void editProfile() async {
    try {
      if (fullnameCtl.text.isNotEmpty &&
          emailCtl.text.isNotEmpty &&
          phoneCtl.text.isNotEmpty) {
        final url = await loadUrl();
        final data = context.read<Data>();

        var body = UpdateprofileRequestGet(
          name: fullnameCtl.text,
          email: emailCtl.text,
          phone: int.parse(phoneCtl.text),
        );

        var jsonBody = updateprofileRequestGetToJson(body);

        var response = await http.put(
          Uri.parse("$url/auth/UpdateProfile/${data.datauser.memberId}"),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: jsonBody,
        );

        if (response.statusCode == 200) {
          handleError.handleError(response);
          data.setDataUser(Member(
              memberId: data.datauser.memberId,
              name: fullnameCtl.text,
              email: emailCtl.text,
              password: data.datauser.password,
              phone: int.parse(phoneCtl.text),
              wallet: data.datauser.wallet,
              isadmin: data.datauser.isadmin));
          _showDialogSuccess();
        } else {
          handleError.handleError(response);
        }
      } else {
        myWidget.showCustomSnackbar("Error", "กรุณากรอกข้อมูลให้ครบ");
      }
    } catch (e) {
      myWidget.showCustomSnackbar("Error", e.toString());
    }
  }

  void _deleteBackend() async {
    try {
      final url = await loadUrl();
      final data = context.read<Data>();

      await http.delete(
          Uri.parse("$url/auth/DeleteAccount/${data.datauser.memberId}"),
          headers: {"Content-Type": "application/json; charset=utf-8"});
    } catch (e) {
      myWidget.showCustomSnackbar("Error", e.toString());
    }
  }

  void _deleteDialog() {
    final screenSize = MediaQuery.of(context).size;
    try {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 34, 34, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/check.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Text(
                    'ลบสำเร็จ',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w800,
                      fontSize: screenSize.width * 0.06,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Center(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // ปิด Dialog
                        navigateLoginOut(); // เรียกฟังก์ชันเปลี่ยนหน้า
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 206, 52, 52)),
                      ),
                      child: Text(
                        'ลบ',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.04,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      myWidget.showCustomSnackbar("Error", e.toString());
    }
  }

  void navigateLoginOut() {
    // ignore: non_constant_identifier_names
    final UserId = context.read<Data>();
    UserId.setDataUser(Member(
        memberId: 0,
        name: "",
        email: "",
        password: "",
        phone: 0,
        wallet: 0,
        isadmin: 0));
    UserId.setPeriod(0);
    UserId.setLastperiod(0);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
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
                'เปลี่ยนข้อมูลเรียบร้อย',
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
