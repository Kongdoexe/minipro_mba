import 'dart:convert';

import 'package:flutter/services.dart';

class Configuration {
  static Future<Map<String, dynamic>> getConfig() {
    return rootBundle.loadString('assets/config/config.json').then((value) {
      // JSON => Map<String , dynamic>
      return jsonDecode(value) as Map<String, dynamic>;
    }).catchError((err) {
      print('Error loading configuration: $err');
      return {};
    });
  }
}
