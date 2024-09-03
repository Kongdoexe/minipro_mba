import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:minipro_mba/config/config.dart';
import 'package:minipro_mba/models/request/getsearchnumber_request_post.dart';
import 'package:minipro_mba/models/request/insertcart_request_post.dart';
import 'package:minipro_mba/models/response/selectalllotto_response_get.dart';
import 'package:minipro_mba/pages/User/CartLotto.dart';
import 'package:minipro_mba/pages/User/CustomerAppBar.dart';
import 'package:minipro_mba/pages/User/CustomerNavbar.dart';
import 'package:http/http.dart' as http;
import 'package:minipro_mba/share/ShareData.dart';
import 'package:provider/provider.dart';

class BuylottoPage extends StatefulWidget {
  // BuylottoPage({Key? key, required this.memberId}) : super(key: key);
  const BuylottoPage({super.key});
  @override
  State<BuylottoPage> createState() => _BuylottoPageState();
}

class _BuylottoPageState extends State<BuylottoPage> {
  int selectedItems = 0;
  late Future<void> loadData;
  List<SelectalllottoResponseGet> alllotto = [];
  List<int> selectedTicketIds = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 4. Asssing loadData
    loadData = loadDataAsync();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _searchController.dispose();
    super.dispose();
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
                              keyboardType: TextInputType.phone,
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: FutureBuilder(
                future: loadData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: alllotto
                          .map((lotto) => Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                width: 150,
                                                height: 50,
                                                child: Card(
                                                  color: const Color.fromARGB(
                                                      255, 186, 186, 186),
                                                  child: Center(
                                                    child: Text(
                                                      lotto.number,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
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
                                                  const EdgeInsets.all(8.0),
                                              child: OutlinedButton(
                                                onPressed: () =>
                                                    choose(lotto.ticketId),
                                                child: const Text(
                                                  'เลือก',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 231, 84, 81),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('${lotto.price} บาท'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  );
                },
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
                        onPressed: check,
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

      InsertcartRequestGet body =
          InsertcartRequestGet(ticketId: ticketId, memberId: memberId);
      var jsonData = insertcartRequestGetToJson(body);
      var response = await http.post(
        Uri.parse('$url/lottery/InsertCart'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonData, // Convert to JSON
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
      GetsearchnumberRequestPost body =
          GetsearchnumberRequestPost(numbers: searchQuery);
      var jsonData = getsearchnumberRequestPostToJson(body);
      var response = await http.post(Uri.parse('$url/lottery/GetSerachNumber'),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: jsonData);

      if (response.statusCode == 200) {
        List<SelectalllottoResponseGet> lottoResults =
            selectalllottoResponseGetFromJson(response.body);

        if (mounted) {
          setState(() {
            alllotto = lottoResults;
            log('First result ticket ID: ${lottoResults.first.ticketId}');
            log('Response body: ${response.body}');
          });
        }
      } else {
        log('Failed to search lotto numbers: ${response.body}');
        log('Response body: ${response.body}');
      }
    } catch (err) {
      log('Error searching lotto numbers: $err');
    }
  }

  void choose(int ticketId) {
    if (mounted) {
      setState(() {
        if (selectedTicketIds.contains(ticketId)) {
          selectedTicketIds.remove(ticketId);
          selectedItems--;
        } else {
          selectedTicketIds.add(ticketId);
          selectedItems++;
        }
      });
    }
  }

  check() {
    var memberId = context.read<Data>();
    if (memberId.datauser.memberId != null) {
      for (int ticketId in selectedTicketIds) {
        insertTicketIntoCart(ticketId, memberId.datauser.memberId);
        log('Inserting ticket ID: $ticketId');
        log('memberId ${memberId.datauser.memberId}');
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CartlottoPage(selectedTicketIds: selectedTicketIds),
        ),
      );
    } else {
      log('Member ID is null');
    }
  }
}
