
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse response) {
//   print(response.payload.toString());
//   //async {
//   //Navigator.push(context,
//
//   MaterialPageRoute(builder: (context) => MyHomePage(imagePath: ''));
//   //);
//   //},
// }

class NotificationService {
  FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();



  Future<void> initNotifications() async {
    //print('initNotifications() called');

    var initSettingsAndroid = const AndroidInitializationSettings('@drawable/denied'); //png cant read, xml drawable ok, but dont know why
    var initSettingsIOS = const DarwinInitializationSettings();
    var initSettings =
    InitializationSettings(android: initSettingsAndroid, iOS: initSettingsIOS);

    notificationsPlugin.initialize(initSettings);
      //onDidReceiveBackgroundNotificationResponse: notificationTapBackground,);
  }

  Future<void> showNotification(int notificationId, int messageCount) async {
    print('Displaying notification $notificationId...');

    var androidSpecifics = const AndroidNotificationDetails(
      "chat",
      "Chat Notifications",
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      icon: 'launch_background',  // only this drawable is OK
      //icon: 'assets/aiunion_icon.png', //test fail
    );
    var iOSSpecifics = const DarwinNotificationDetails();
    var platformSpecifics = NotificationDetails(android: androidSpecifics, iOS: iOSSpecifics);

    await notificationsPlugin.show(
      notificationId,
      '推文標題!',
      '告警通報:內文自由發揮',
      platformSpecifics,
    );
  }
}
