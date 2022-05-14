import 'package:aura_web_dashboard/app/locator.dart';
import 'package:aura_web_dashboard/models/users_model.dart';
import 'package:aura_web_dashboard/services/api_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class UsersViewModel extends FutureViewModel {

  final APIService  _apiService = getIt.get<APIService>();
  final Logger      _logger     = Logger();
  UsersModel?       _usersModel;

  UsersModel? get usersModel => _usersModel;

  List<String> items = [];

  String dropdownvalue = '';   

  void setDropdownValue(String? val) async {
    dropdownvalue = val!;
    notifyListeners();
  }
  
  @override
  Future futureToRun() async {
    _usersModel = await _apiService.getUsers();
  }
  
  @override
  void onError(error) {
    _logger.e(error);
  }

}