import 'package:equatable/equatable.dart';
import 'package:currency_converter/src/data/models/previous_conversions_model.dart';

abstract class PreviousConversionStates extends Equatable {
  const PreviousConversionStates();

  @override
  List<Object> get props => [];
}

class LoadingState extends PreviousConversionStates {}

class LoadingFailure extends PreviousConversionStates {}

class GetAllPreviousConversionsSuccess extends PreviousConversionStates {
  final List<PreviousConversionModel>? response;

  const GetAllPreviousConversionsSuccess([this.response]);

  @override
  List<Object> get props => [response!];

  @override
  String toString() => 'GetAllPreviousConversions { Conversions: $response }';
}
