import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/getsearchnumber_request_post.dart';
import 'package:minipro_mba/models/request/insertcart_request_post.dart';
import 'package:minipro_mba/models/response/selectalllotto_response_get.dart';
import 'package:minipro_mba/pages/User/CartLotto.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BuylottoPage extends StatefulWidget {
  int memberId = 0;
  // BuylottoPage({Key? key, required this.memberId}) : super(key: key);
  BuylottoPage({super.key, required this.memberId});
  @override
  State<BuylottoPage> createState() => _BuylottoPageState();
}

class _BuylottoPageState extends State<BuylottoPage> {
  int selectedItems = 0;
  late Future<void> loadData;
  List<SelectalllottoResponseGet> alllotto = [];
  List<int> selectedTicketIds = [];
  final TextEditingController _searchController = TextEditingController();
  int? memberId;

  @override
  void initState() {
    super.initState();
    // 4. Asssing loadData
    loadData = loadDataAsync();
    _loadMemberId();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _searchController.dispose();
    super.dispose();
  }

  void _loadMemberId() async {
  int? memberId = await getMemberId();
  if (memberId != null) {
    setState(() {
      widget.memberId = memberId;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 138, 128, 1),
      appBar: CustomAppBar(
        screenSize: screenSize,
        namePage: 'ซื้อสลาก',
      ),
      body: Container(
          child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('ค้นหาเลขเด็ด',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('งวดวันที่ 1 กันยายน 2567'),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _searchController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilledButton(
                              onPressed: () {
                                  // Call search when button is pressed
                                  search(_searchController.text);
                                },
                              child: const Text('ค้นหาเลข'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromRGBO(230, 92, 87, 1)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  //const Icon(Icons.shopping_cart), // ไอคอนรถเข็น
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                        30, 5, 30, 10), // ระยะห่างระหว่าง card กับเส้น
                    height: 2.0, // ความหนาของเส้น
                    color: Colors.black, // สีของเส้น
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('เลขที่ยังไม่ถูกขาย',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: FutureBuilder(
                        future: loadData,
                        builder: (context, snapshot) {
                          // ถ้ายังไม่เจอข้อมูลให้แสดงหมุนๆ รอการโหลด
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return Column(
                            children: alllotto
                                .map((lotto) => Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: SizedBox(
                                                      width:
                                                          150, // กำหนดความกว้างของ Card
                                                      height:
                                                          50, // กำหนดความสูงของ Card
                                                      child: Card(
                                                        color: const Color.fromARGB(
                                                            255, 186, 186, 186),
                                                        child: Center(
                                                          child: Text(
                                                            '${lotto.number}',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Text('งวดที่'),
                                                  Text('${lotto.period}'),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: OutlinedButton(
                                                      onPressed: () => choose(
                                                          lotto.ticketId,
                                                          lotto.memberId),
                                                      child: const Text('เลือก',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        side: const BorderSide(
                                                            color: Color.fromARGB(
                                                                255,
                                                                231,
                                                                84,
                                                                81)), // กำหนดสีขอบ
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                        '${lotto.price} บาท'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(), // แปลง Iterable<Card> เป็น List<Widget>
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          if (selectedItems > 0) ...[
            //ตรวจสอบการเลือกสลาก
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('สลากที่เลือก $selectedItems ใบ'),
                      ElevatedButton(
                        onPressed: check(),
                        child: const Text(
                          'ตรวจสอบสลากของคุณ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 231, 84, 81),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      )),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (value) {},
        screenSize: screenSize,
      ),
    );
  }

  Future<int?> getMemberId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('memberId');
  }

  Future<void> loadDataAsync() async {
    //Get url endpoint from config
    var value = await Configuration.getConfig();
    var url = value['apiEndpoint'];
    //Call api /trips
    var data = await http.get(Uri.parse("$url/lottery/SelectAllLotto"));
    alllotto = selectalllottoResponseGetFromJson(data.body);
  }

  Future<void> insertTicketIntoCart(int ticketId, int memberId) async {
    try {
      // Get the config and API endpoint
      var config = await Configuration.getConfig();
      var url = config['apiEndpoint'];

      // Create an instance of InsertcartRequestGet
      var request =
          InsertcartRequestGet(ticketId: ticketId, memberId: memberId);

      // Make the POST request to insert the ticket
      var response = await http.post(
        Uri.parse('$url/lottery/InsertCart'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: insertcartRequestGetToJson(request), // Convert to JSON
      );

      if (response.statusCode == 200) {
        // Successfully inserted
        log('Ticket inserted successfully');
      } else {
        // Handle the error
        log('Failed to insert ticket: ${response.body}');
      }
    } catch (err) {
      log('Error inserting ticket: $err');
    }
  }

  void search(String searchQuery) async {
  try {
 
    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];

    var response = await http.post(Uri.parse('$url/lottery/GetSerachNumber?numbers=$searchQuery'));

    if (response.statusCode == 200) {
      
      GetsearchnumberRequestPost searchResults = getsearchnumberRequestPostFromJson(response.body);

    
      List<SelectalllottoResponseGet> lottoResults = searchResults.; 

   
      if (mounted) {
        setState(() {
          alllotto = lottoResults;  
          log('First result ticket ID: ${lottoResults.first.ticketId}');
        });
      }
    } else {
     
      log('Failed to search lotto numbers: ${response.body}');
    }
  } catch (err) {
    log('Error searching lotto numbers: $err');
  }
}



  void choose(int ticketId, int memberId) {
    if (mounted) {
      setState(() {
        if (selectedTicketIds.contains(ticketId)) {
          selectedTicketIds.remove(ticketId);
          selectedItems--;
        } else {
          selectedTicketIds.add(ticketId);
          selectedItems++;
          insertTicketIntoCart(ticketId, memberId);
        }
      });
    }
  }

  check() {
<<<<<<< HEAD
    for (int ticketId in selectedTicketIds) {
      insertTicketIntoCart(ticketId, widget.memberId);
    }
=======
    // for (int ticketId in selectedTicketIds) {
    //   insertTicketIntoCart(ticketId, memberId);
    // }

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CartlottoPage(selectedTicketIds: selectedTicketIds),
        ));
  }
}

