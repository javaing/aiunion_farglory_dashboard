import 'AbstractService.dart';
import 'mqtt_service.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

//all services new in here
setupServiceLocator() {
  print('---------------------- setupServiceLocator ------------------------');
  getIt.registerLazySingleton<MQTTService>(() => MQTTService());
}