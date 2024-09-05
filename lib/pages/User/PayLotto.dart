import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';

class PaylottoPage extends StatefulWidget {
  const PaylottoPage({super.key});

  @override
  State<PaylottoPage> createState() => _PaylottoPageState();
}

class _PaylottoPageState extends State<PaylottoPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(screenSize: screenSize, namePage: 'ตรวจสลาก'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Card(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text('ชำระเงิน',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: SizedBox(
                          width: 1000,
                          height: 120,
                          child: Card.outlined(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/paywallet.png',
                                    width: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text('ชำระเงินผ่านวอลเล็ท',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('คุณมีเงินคงเหลือ',
                                              style: TextStyle(
                                                fontSize: 14,
                                              )),
                                          Text(
                                            ' 100 ',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 214, 65, 65),
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text('บาท',
                                              style: TextStyle(
                                                fontSize: 14,
                                              )),
                                        ],
                                      ),
                                      FilledButton(
                                        onPressed: paylotto,
                                        child: const Text(
                                          'ชำระเงิน',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromARGB(
                                                      255, 240, 117, 29)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  void paylotto() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text('สำเร็จ'),
          content: const Text('การชำระเงินของคุณสำเร็จแล้ว'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }
}
