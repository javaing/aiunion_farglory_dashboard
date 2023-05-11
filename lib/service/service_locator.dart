

import 'mqtt_service.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

//all services new in here
setupService() {
  print('---------------------- setupServiceLocator ------------------------');
  getIt.registerLazySingleton<MQTTService>(() => MQTTService());
  //getIt.registerLazySingleton<WebSocket_Service>(() => WebSocket_Service());
}