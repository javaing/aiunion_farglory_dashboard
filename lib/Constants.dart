
import 'dart:ui';

String MQTT_SERVER = "192.168.0.136";
final int MQTT_PORT = 1883;
final String MQTT_TOPIC = "farglory";
//final String MQTT_TOPIC = "aidesk";

//final String DEFAULT_WS_SERVER = "192.168.0.109";
final String DEFAULT_WS_SERVER = "60.250.33.237";
final String DEFAULT_IN_DEVICEIDS = "5";
final String DEFAULT_OUT_DEVICEIDS = "3";
final String DEFAULT_CLEARUP_TIME = "18:00";
final String DEFAULT_RESET_TIME = "00:01";
final String DEFAULT_AI_SERVER = "60.250.33.237:60105";

String Weather_APIKEY = "CWB-D203008C-2640-4F20-A839-CD3708D26517";
String Weather_URL = "https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-005?Authorization=$Weather_APIKEY&format=JSON&locationName=%town&elementName=Wx,AT";

String HOST = "";
const int WS_PORT = 80;
const String WS_TOPIC = "/ws/websocket";
final String V2_TOKEN = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiZmFjZWFpIl0sInNjb3BlIjpbImFwaS1zZXJ2aWNlIl0sImV4cCI6MTkyMTE1MzI1OCwiYXV0aG9yaXRpZXMiOlsiYWl1bmlvbiJdLCJqdGkiOiI3ODI3YTBkYi0zMGQ3LTRhODItYjQyYy0yMTQ0NTMyZWRlNDEiLCJjbGllbnRfaWQiOiJhcGktY2xpZW50In0.mE8WnaGzVuWhS5LfT0ajQcBr_JP2TUOVfhch-5dJ6mA";


const String PREF_KEY_WS_SERVER = 'WS_SERVER';
final String PREF_KEY_IN_DEVICEIDS = 'IN_DEVICEIDS';
const String PREF_KEY_OUT_DEVICEIDS = 'OUT_DEVICEIDS';
const String PREF_KEY_CLEARUP_TIME = 'CLEARUP_TIME';
const String PREF_KEY_RESET_TIME = 'RESET_TIM';
const String PREF_KEY_ENTER_COUNT = 'ENTER_COUNT';
const String PREF_KEY_LEAVE_COUNT = 'LEAVE_COUNT';
const String PREF_KEY_PROFILE_POOL = 'PROFILE_POOL';
const String PREF_KEY_PROFILE_REMAIN = 'PROFILE_REMAIN';
const String PREF_KEY_AI_SERVER = 'AI_SERVER';
const String PREF_KEY_DEDUPLICATE_SECOND = 'EDUPLICATE_SECOND';
const String PREF_KEY_VENDOR = 'VENDOR';
const String PREF_KEY_ENTER_UNIQUE_FACEID = 'ENTER_UNIQUE_NAME';
const String PREF_KEY_LEAVE_UNIQUE_FACEID = 'LEAVE_UNIQUE_NAME';



const Color borderColor = Color.fromARGB(255, 224, 224, 224);
Color normalBackground = const Color.fromARGB(255, 16, 16, 16);
Color enterCountColor = const Color.fromARGB(255, 0, 51, 204);
Color leaveCountColor = const Color.fromARGB(255, 0, 102, 51);
Color resideCountColor = const Color.fromARGB(255, 204, 51, 0);
Color pieChartOrange = const Color.fromARGB(255, 255, 153, 0);

Color pieChart1 = const Color.fromARGB(255, 255, 255, 0);
Color pieChart2 = const Color.fromARGB(255, 0, 39, 204);
Color pieChart3 = const Color.fromARGB(255, 255, 39, 153);
Color pieChart4 = const Color.fromARGB(255, 0, 153, 39);
Color pieChart5 = const Color.fromARGB(255, 0, 255, 255);

Color pieChart6 = const Color.fromARGB(255, 0, 128, 0);
Color pieChart7 = const Color.fromARGB(255, 128, 0, 128);
Color pieChart8 = const Color.fromARGB(255, 128, 128, 0);
Color pieChart9 = const Color.fromARGB(255, 0, 128, 128);
Color pieChart10 = const Color.fromARGB(255, 0, 0, 128);
const double BORER_WIDTH = 3.0;