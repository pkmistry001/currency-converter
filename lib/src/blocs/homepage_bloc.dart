import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currency_converter/src/states/homepage_states.dart';
import 'package:currency_converter/src/events/homepage_events.dart';
import 'package:currency_converter/src/repositories/homepage_repository.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageStates> {
  final HomePageRepository repository = HomePageRepository();

  HomePageBloc(HomePageStates initialState) : super(initialState);

  @override
  Stream<HomePageStates> mapEventToState(HomePageEvent event) async* {
    if (event is GetAvailableCurrenciesEvent)
      yield* _getAvailableCurrenciesBloc(event);
    if (event is GetExchangeRatesEvent) yield* _getExchangeRatesEvent(event);
    if (event is SaveConversionsEvent) yield* _saveConversionBloc(event);
  }

  Stream<HomePageStates> _getAvailableCurrenciesBloc(
      GetAvailableCurrenciesEvent event) async* {
    yield LoadingState();
    try {
      yield GetAvailableCurrenciesSuccess(
          await repository.getAvailableCurrenciesRepo());
    } catch (e) {
      print(e.toString());
      yield LoadingFailure();
    }
  }

  Stream<HomePageStates> _getExchangeRatesEvent(
      GetExchangeRatesEvent event) async* {
    yield LoadingState();
    try {
      yield GetExchangeRateSuccess(await repository.getExchangeRateRepo(event));
    } catch (e) {
      print(e.toString());
      yield LoadingFailure();
    }
  }

  Stream<HomePageStates> _saveConversionBloc(
      SaveConversionsEvent event) async* {
    yield LoadingState();
    try {
      yield SaveConversionSuccess(await repository.saveConversionRepo(event));
    } catch (e) {
      print(e.toString());
      yield LoadingFailure();
    }
  }
}
