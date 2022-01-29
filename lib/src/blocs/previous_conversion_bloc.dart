import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currency_converter/src/events/previous_conversions_events.dart';
import 'package:currency_converter/src/repositories/previous_conversions_repository.dart';
import 'package:currency_converter/src/states/previous_conversions_screen_states.dart';

class PreviousConversionsBloc
    extends Bloc<PreviousConversionsEvent, PreviousConversionStates> {
  final PreviousConversionsRepository repository =
      PreviousConversionsRepository();

  PreviousConversionsBloc(PreviousConversionStates initialState)
      : super(initialState);

  @override
  Stream<PreviousConversionStates> mapEventToState(
      PreviousConversionsEvent event) async* {
    if (event is GetAllPreviousConversions)
      yield* _getAllPreviousConversionsBloc(event);
  }

  Stream<PreviousConversionStates> _getAllPreviousConversionsBloc(
      GetAllPreviousConversions event) async* {
    yield LoadingState();
    try {
      yield GetAllPreviousConversionsSuccess(
          await repository.getPreviousConversionsRepo());
    } catch (e) {
      print(e.toString());
      yield LoadingFailure();
    }
  }
}
