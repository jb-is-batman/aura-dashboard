import 'dart:convert';

import 'package:aura_web_dashboard/models/panic_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

const String _baseUrl = "https://k9bvw34co4.execute-api.us-east-1.amazonaws.com";
final Logger _logger = Logger();

class APIService {

    Future<Map<String, String>> _getHeader() async {

    Map<String, String> header = {
      "Content-Type": "application/json",
      "Accept"      : "*/*",
    };

    return header;
  }

  Future<PanicModel?> getPanics() async {
    Uri                 endpoint  = Uri.parse("$_baseUrl/panic");
    Map<String,String>  headers   = await _getHeader();

    try {
      http.Response response = await http.get(
        endpoint,
        headers: headers
      );
      
      if(!isResponseSuccess(response: response)) return null;

      List<dynamic>  responseBody  = jsonDecode(response.body);
      
      PanicModel           panicModel     = PanicModel.fromJson(responseBody);
      return panicModel;
    } catch (e) {
      _logger.e(e);
      return null;
    }
  } 

  bool isResponseSuccess({required http.Response response}) {
    if(response.statusCode < 200 || response.statusCode > 299) {
      switch (response.statusCode) {
        case 401:
          _logger.e("${response.statusCode}\n${response.body}");
          break;
        default:
          _logger.e("${response.statusCode}\n${response.body}");
          break;
      }
      return false;
    }
    return true;
  }
}