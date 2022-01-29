import 'package:http/http.dart';
import 'package:currency_converter/src/utils/apis.dart';
import 'package:currency_converter/src/data/api_client.dart';
import 'package:currency_converter/src/utils/api_response.dart';
import 'package:currency_converter/src/data/database_helper.dart';
import 'package:currency_converter/src/events/homepage_events.dart';
import 'package:currency_converter/src/data/models/currency_model.dart';

class HomePageRepository {
  final ApiClient client = ApiClient();

  Future<List<CurrencyModel>> getAvailableCurrenciesRepo() async {
    final resultAPI = await client.getRequest("$API_GET_AVAILABLE_CURRENCIES");

    List<CurrencyModel> listOfCurrency = [];
    apiResponse(resultAPI).forEach((key, value) {
      listOfCurrency.add(CurrencyModel(key, value));
    });

    return listOfCurrency;
  }

  Future<Response> getExchangeRateRepo(GetExchangeRatesEvent event) async {
    var endPoint =
        "$API_GET_EXCHANGE_RATE${event.sourceCurrency}/${event.targetCurrency}.json";

    final resultAPI = await client.getRequest(endPoint);
    return resultAPI;
  }

  Future<String> saveConversionRepo(SaveConversionsEvent event) async {
    await DatabaseHelper.saveConversion(event.previousConversionModel);
    return "Saved";
  }
}
