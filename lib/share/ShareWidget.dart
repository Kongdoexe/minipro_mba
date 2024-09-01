import 'dart:ui'; // Required for BackdropFilter and ImageFilter
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWidget {
  void showCustomSnackbar(String title, String msgValue) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      backgroundColor:
          Colors.transparent, // Transparent to allow the blur to show
      duration: const Duration(seconds: 2),
      messageText: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black
                  .withOpacity(0.5), // Background color with transparency
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  msgValue,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
