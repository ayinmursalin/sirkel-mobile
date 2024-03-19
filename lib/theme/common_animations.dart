import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonAnimations {
  static Widget getAnim(
    String filename, {
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Lottie.asset(
      _getPath(filename),
      width: width,
      height: height,
      fit: fit,
    );
  }

  static String _getPath(String filename) {
    return "assets/animations/$filename";
  }
}
