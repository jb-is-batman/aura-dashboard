import 'package:aura_web_dashboard/app/locator.dart';
import 'package:aura_web_dashboard/models/clients_model.dart';
import 'package:aura_web_dashboard/models/panic_model.dart';
import 'package:aura_web_dashboard/services/api_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class PanicsViewModel extends FutureViewModel {

  PanicModel?       _panicModel;
  ClientsModel?     _clientsModel;
  final APIService  _apiService         = getIt.get<APIService>();
  final Logger      _logger             = Logger();

  PanicModel?       get panicModel      => _panicModel;
  ClientsModel?     get clientsModel    => _clientsModel;
  
  @override
  Future futureToRun() async {
    _panicModel     = await _apiService.getPanics();
    _clientsModel   = await _apiService.getClients();
  }
  
  @override
  void onError(error) {
    _logger.e(error);
  }

  void onDropdownChange(dynamic val, int index) {
    _panicModel!.panics[index].clientName = val;
    notifyListeners();
  }
}