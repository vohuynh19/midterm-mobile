import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class Utils {
  static Image imageFromBase64String(String base64String) {
    Uint8List bytesImage = const Base64Decoder().convert(base64String);
    return Image.memory(bytesImage);
  }
}
