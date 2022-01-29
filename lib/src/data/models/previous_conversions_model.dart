import 'package:hive/hive.dart';
import 'package:currency_converter/src/data/models/currency_model.dart';

part 'previous_conversions_model.g.dart';

@HiveType(typeId: 0)
class PreviousConversionModel {
  @HiveField(0)
  String? date;

  @HiveField(1)
  CurrencyModel? sourceCurrency;

  @HiveField(2)
  CurrencyModel? targetCurrency;

  @HiveField(3)
  double? sourceValue;

  @HiveField(4)
  double? targetValue;

  PreviousConversionModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    sourceCurrency = json['sourceCurrency'];
    targetCurrency = json['targetCurrency'];
    sourceValue = json['sourceValue'];
    targetValue = json['targetValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['sourceCurrency'] = this.sourceCurrency;
    data['targetCurrency'] = this.targetCurrency;
    data['sourceValue'] = this.sourceValue;
    data['targetValue'] = this.targetValue;
    return data;
  }

  PreviousConversionModel(
      {this.date,
      this.sourceCurrency,
      this.targetCurrency,
      this.sourceValue,
      this.targetValue});
}
