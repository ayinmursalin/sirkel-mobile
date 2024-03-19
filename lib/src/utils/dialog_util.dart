import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtil {
  static void showToastMessage(String? message) {
    Fluttertoast.showToast(
      msg: message ?? '',
      backgroundColor: Colors.black.withOpacity(0.65),
    );
  }
}
