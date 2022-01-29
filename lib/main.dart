import 'dart:io';
import 'package:currency_converter/src/data/models/currency_model.dart';
import 'package:currency_converter/src/data/models/previous_conversions_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/src/ui/homepage.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(PreviousConversionModelAdapter());
  Hive.registerAdapter(CurrencyModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
