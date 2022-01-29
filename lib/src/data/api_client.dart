import 'dart:io';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:currency_converter/src/utils/apis.dart';
import 'package:currency_converter/src/utils/AppException.dart';

class ApiClient {
  var response;
  final http.Client httpClient = http.Client();

  final Map<String, String> header = {
    HttpHeaders.contentTypeHeader: CONTEXT_TYPE_APPLICATION_JSON,
  };

  Future<Response> getRequest(String endPoint) async {
    print("endpoint of server call : $endPoint");
    try {
      response = await httpClient.get(
        Uri.https("$API_BASE_URL", endPoint),
        headers: header,
      );
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return response;
  }
}
