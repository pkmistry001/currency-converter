import 'package:hive/hive.dart';

part 'currency_model.g.dart';

@HiveType(typeId: 1)
class CurrencyModel {
  @HiveField(0)
  final String key;

  @HiveField(1)
  final String value;

  CurrencyModel(this.key, this.value);
}
