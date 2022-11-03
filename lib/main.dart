import 'dart:async';
import 'dart:io';

import 'package:elective/models/joke.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:elective/app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    HttpOverrides.global = PostHttpOverrides();
    WidgetsFlutterBinding.ensureInitialized();
    Directory directory = await getApplicationDocumentsDirectory();

    Hive
      ..init(directory.path)
      ..registerAdapter(JokeAdapter());
    await Hive.openBox<Joke>('jokeBox');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(const ChuckNorrisApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
