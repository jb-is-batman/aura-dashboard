import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {

    List<String> items = [   
    '', 
    'National',
    'ADT',
    'Beagle',
    'Cortac',
    'Momentum',
  ];
  String dropdownvalue = '';   

  void setDropdownValue(String? val) {
    dropdownvalue = val!;
    notifyListeners();
  }

}