import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:currency_converter/src/data/models/currency_model.dart';

abstract class HomePageStates extends Equatable {
  const HomePageStates();

  @override
  List<Object> get props => [];
}

class LoadingState extends HomePageStates {}

class LoadingFailure extends HomePageStates {}

class GetAvailableCurrenciesSuccess extends HomePageStates {
  final List<CurrencyModel>? listOfCurrency;

  const GetAvailableCurrenciesSuccess([this.listOfCurrency]);

  @override
  List<Object> get props => [listOfCurrency!];

  @override
  String toString() => 'GetAvailableCurrencies { Currencies: $listOfCurrency }';
}

class GetExchangeRateSuccess extends HomePageStates {
  final Response? response;

  const GetExchangeRateSuccess([this.response]);

  @override
  List<Object> get props => [response!];

  @override
  String toString() => 'GetExchangeRate { ExchangeRateSuccess: $response }';
}

class SaveConversionSuccess extends HomePageStates {
  final String? response;

  const SaveConversionSuccess([this.response]);

  @override
  List<Object> get props => [response!];

  @override
  String toString() => 'SaveConversionSuccess { save: $response }';
}
