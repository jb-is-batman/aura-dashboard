import 'dart:convert';

import 'package:aura_web_dashboard/models/panic_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<PanicModel?> getPanics() async {
    
    Uri endpoint = Uri.parse("");

    try {
      http.Response response = await http.get(
        endpoint
      );
      
      if(!isResponseSuccess(response: response)) return null;

      Map<String, dynamic>  responseBody  = jsonDecode(response.body);
      print(responseBody['data']);
      PanicModel           panicModel     = PanicModel.fromJson(responseBody["data"]);
      return panicModel;
    } catch (e) {
      print(e.toString());
    }
  } 

  bool isResponseSuccess({required http.Response response}) {
    if(response.statusCode < 200 || response.statusCode > 299) {
      switch (response.statusCode) {
        case 401:
          print("${response.statusCode}\n${response.body}");
          break;
        default:
          print("${response.statusCode}\n${response.body}");
          break;
      }
      return false;
    }
    return true;
  }
}