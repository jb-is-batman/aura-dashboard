import 'package:aura_web_dashboard/services/api_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<APIService>(() => APIService());
}