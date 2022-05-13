import 'package:aura_web_dashboard/app/locator.dart';
import 'package:aura_web_dashboard/models/panic_model.dart';
import 'package:aura_web_dashboard/services/api_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends FutureViewModel {


  final APIService  _apiService = getIt.get<APIService>();
  final Logger      _logger     = Logger();
  PanicModel?       _panicModel;

  PanicModel? get panicModel => _panicModel;

    List<String> items = [];

  String dropdownvalue = '';   

  void setDropdownValue(String? val) async {
    dropdownvalue = val!;
    notifyListeners();
  }
  
  @override
  Future futureToRun() async {
    _panicModel = await _apiService.getPanics();
  }
  
  @override
  void onError(error) {
    _logger.e(error);
  }
}