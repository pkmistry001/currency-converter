import 'package:equatable/equatable.dart';

abstract class PreviousConversionsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllPreviousConversions extends PreviousConversionsEvent {
  GetAllPreviousConversions();

  @override
  List<Object> get props => [int];
}
