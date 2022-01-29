import 'package:currency_converter/src/data/models/previous_conversions_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAvailableCurrenciesEvent extends HomePageEvent {
  GetAvailableCurrenciesEvent();

  @override
  List<Object> get props => [];
}

class GetExchangeRatesEvent extends HomePageEvent {
  final String sourceCurrency;
  final String targetCurrency;

  GetExchangeRatesEvent(this.sourceCurrency, this.targetCurrency);

  @override
  List<Object> get props => [String];
}

class SaveConversionsEvent extends HomePageEvent {
  final PreviousConversionModel previousConversionModel;

  SaveConversionsEvent(this.previousConversionModel);

  @override
  List<Object> get props => [];
}
