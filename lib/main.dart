import 'dart:io';

import 'package:flutter/material.dart';
import 'package:elective/app.dart';

void main() {
  HttpOverrides.global = new PostHttpOverrides();
  runApp(const ChuckNorrisApp());
}

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
