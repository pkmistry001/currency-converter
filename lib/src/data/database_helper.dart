import 'package:hive/hive.dart';
import 'package:currency_converter/src/data/models/previous_conversions_model.dart';

class DatabaseHelper {
  static saveConversion(PreviousConversionModel data) async {
    var box = await Hive.openBox<PreviousConversionModel>(
        'previous_conversions_model');
    box.add(data);
  }

  static Future<List<PreviousConversionModel>> getAllConversion() async {
    var box = await Hive.openBox<PreviousConversionModel>(
        'previous_conversions_model');

    return box.values.toList();
  }
}
