import '../datamodel/FarGloryMsg.dart';
import '../datamodel/Profile.dart';
import '../service/mqtt_service.dart';
import '../service/service_locator.dart';
import '../util/Utils.dart';

//final List<String> headerInfo = ['GPT-4掀起AI界高潮，ChatGPT之父卻怕了：我設了一個終止開關    敬禮！張育成獲經典賽最佳一壘手    BLACKPINK七月再來台？「主辦方員工」洩消息',
//  '            26°  大致晴朗'];
final String headerNews = '進行高空作業前，一定要確認安全掛勾是否扣上     進入狹窄的空間前，進入狹窄的空間前，    進入工地戴安全帽（安全帽區域）     確實配戴背負式安全帶（磨損的安全線束）';
final String headerWeather = '26°\n大致晴朗';
final List<String> leftRow1Title = ['進場人次','出場人次','現場人數'];
final List<String> clearupTitle = ['進場人次','出場人次','滯留人數'];
//List<String> leftRow1Count = ["99","0","99"];
int leaveCount = 0;
const String enterStr = '進場';
const String leaveStr = '出場';

final List<String> workTypeTitle = ['點工', '板模', '水泥', '排水', '電氣', '吊臂', '砂石'];
List<int> workTypeCount = [15, 8, 13, 8, 5, 2, 8];





final List<String> environTitle = ['PM2.5', 'PM10', '紫外線指數', "噪音", "濕度", "溫度", "風速"];
List<String> environCount = ["21", "66", "6", "86 db", "75%", "27度C", "4.4m/s"];
List<String> environColor = ["yellow", "green", "red", "green", "green", "green", "green"];

// List<String> vendorTitle = ['榮工處', '華雄營造', '大林組', '三重埔營造', '大肚營造', '金豪營造'];
// List<int> vendorCount = [9, 20, 20, 20, 20, 10];

List<String> vendorTitle2 = ['承包商A', '承包商B', '承包商C', '承包商D', '承包商E', '承包商F', '承包商G', '承包商H', '', ''];
List<double> vendorCount2 = [40, 20, 20, 10, 5, 5, 5, 5, 0, 0];

 final List<String> rightRowTitle = ['廠商A', '廠商B', '廠商C', '廠商D', '廠商E', '廠商F', '廠商G','廠商H'];
// List<int> rightRowCount = [7, 8, 5, 6, 15, 35, 3, 5];

List<String> workerImages = ['worker1.png', 'worker2.png', 'worker3.png', 'worker4.png', 'worker5.png'];
List<String> workerNames = ['姜才藝','黃文柏','蘇銳思','沈立誠','徐涵暢','萬泰清','孫鵬翼','史俊雄','湯嘉石','秦承運','李文成','夏陽舒','袁經義','盧樂湛','謝俊材','段雨星','崔俊哲',];
List<bool> boolList = [true, true, true, true]; //酒測 工地帽 背心 效期內,非黑名單
List<bool> boolListDrink = [false, true, true, true];
List<bool> boolListHat = [true, false, true, true];
List<bool> boolListBlack = [true, true, true, false];

List<Profile> profiles1 = [
  Profile(name: '陳 * 榮', profession: rightRowTitle[0], imageUrl: workerImages[0], action: enterStr, boolList: boolList),
  Profile(name: '林 * 華', profession: rightRowTitle[1], imageUrl: workerImages[1], action: enterStr, boolList: boolList ),
  Profile(name: '黃 * 林', profession: rightRowTitle[2], imageUrl: workerImages[2], action: enterStr, boolList: boolList),
];
List<Profile> profilesRemain = [
  Profile(name: '黃 * 林', profession: rightRowTitle[3], imageUrl: workerImages[2], action: leaveStr, boolList: boolList ),
  Profile(name: '張 * 勇', profession: rightRowTitle[4], imageUrl: workerImages[3], action: leaveStr, boolList: boolList ),
  Profile(name: '陳 * 榮', profession: rightRowTitle[5], imageUrl: workerImages[4], action: leaveStr, boolList: boolList ),
  Profile(name: '陳 * 榮', profession: rightRowTitle[0], imageUrl: workerImages[0], action: enterStr, boolList: boolList),
  Profile(name: '孫 * 翼', profession: rightRowTitle[1], imageUrl: workerImages[1], action: enterStr, boolList: boolList),
];
List<Profile> profilesPool = [
  Profile(name: '陳 * 榮', profession: rightRowTitle[0], imageUrl: workerImages[0], action: enterStr, boolList: boolList),
  Profile(name: '林 * 華', profession: rightRowTitle[1], imageUrl: workerImages[1], action: enterStr, boolList: boolListDrink),
  //Profile(name: '黃 * 林', profession: rightRowTitle[2], imageUrl: workerImages[2], action: enterStr),
  // Profile(name: '陳 * 榮', profession: rightRowTitle[3], imageUrl: workerImages[3], action: enterStr),
  Profile(name: '林 * 華', profession: rightRowTitle[4], imageUrl: workerImages[4], action: enterStr, boolList: boolListBlack),
   Profile(name: '陳 * 榮', profession: rightRowTitle[5], imageUrl: workerImages[0], action: leaveStr, boolList: boolList),
  //Profile(name: '林 * 華', profession: rightRowTitle[1], imageUrl: workerImages[1], action: leaveStr),
];
List<Profile> profiles = [
];
final int LIMIT_LIST_PROFILE = 5;

enum DisplayMode {
  punch,
  clearup,
}
DisplayMode currentMode = DisplayMode.punch ; //差勤或清場

class TableScreenViewModel {
  TableScreenViewModel() {
    //print('art 0321 view model init');
    MQTTService _myService = getIt<MQTTService>();
    _myService.setCallback(cb);
  }

  cb(FarGloryMsg msg) {
    //showMsg(context, action);
    print('art 0413 view model msg.imgUrl=' + (msg.imgUrl ?? ' ') );
    Profile p = genProfile(enterStr);
    if(msg.imgUrl!=null) {
      p.imageUrl = msg.imgUrl!;
    }
    if(profilesPool.length==4) {
      p.boolList = boolListHat;
    }

    if(currentMode == DisplayMode.clearup) {
      leaveCount = leaveCount+1;
      profilesRemain.removeLast();
    } else {
      switch(msg.action) {
        case "enter":
          vendorCount2[0] = vendorCount2[0]+1;
          //profiles1.add(p);
          profilesPool.add(p);
          break;

        case "leave":
          leaveCount = leaveCount+1;
          //vendorCount2[0] = vendorCount2[0]-1;
          //Profile p = genProfile(leaveStr);
          p.action = leaveStr;
          //profiles2.add(p);
          profilesPool.add(p);
          break;

        default:
          break;
      }
    }


    // if(profiles1.length > LIMIT_LIST_PROFILE) {
    //   profiles1.removeRange(0, profiles1.length-LIMIT_LIST_PROFILE);
    // }
    // if(profiles2.length > LIMIT_LIST_PROFILE) {
    //   profiles2.removeRange(0, profiles2.length-LIMIT_LIST_PROFILE);
    // }
  }

  Profile genProfile(String actionStr) {
    String name = randomListItem(workerNames).replaceRange(1, 2, ' * ');
    String vendor = "${randomListItem(vendorTitle2)}-${randomListItem(workTypeTitle)}";
    return Profile(name: name, profession: vendor, imageUrl: randomListItem(workerImages), action: actionStr,  boolList: boolList);
  }

}