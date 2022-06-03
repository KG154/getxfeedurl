import 'package:feedurl/Controller/Api_Controller.dart';
import 'package:get/get.dart';

class DropDownController extends GetxController {
  var selectedMediaType = "Music".obs;
  var selectedContry = "United State".obs;
  var selectedType = "Albums".obs;
  var selectedFeed = "Most Played".obs;
  var selectedFormat = "JSON".obs;
  RxList responsedata = <Results>[].obs;

  RxList TypeList = ['Albums', 'Music Videos', 'Playlists', 'Songs'].obs;
  RxMap feedList = {'Most Played': 'most-played'}.obs;
  RxMap FormatList = {'JSON': 'json'}.obs;
  Map<String, String> countrys = {
    "United State": "us",
    "India": "in",
    "Taiwan": "tw",
    'Spain': "es",
    'Tonga': 'to',
    'Egypt': 'eg',
    'Australia': 'au',
    'United Kingdom': 'gb',
  };

  RxString selectedItemCount = "10".obs;
  List<String> showItemsonpageList = ["10", "25", "50"];

  List<Map<String, dynamic>> mediaTypes = [
    {
      'name': 'Music',
      'types': ['Albums', 'Music Videos', 'Playlists', 'Songs'],
      'feed': {'Most Played': 'most-played'},
      'formant': <String, String>{'JSON': 'json'}
    },
    {
      'name': 'Podcasts',
      'types': <String>['Podcasts', 'Podcast Episodes'],
      'feed': <String, String>{'Top': 'top'},
      'formant': <String, String>{'JSON': 'json'}
    },
    {
      'name': 'Apps',
      'types': <String>['Apps'],
      'feed': <String, String>{'Top Free': 'top-free', 'Top Paid': 'top-paid'},
      'formant': <String, String>{'JSON': 'json'}
    },
    {
      'name': 'Books',
      'types': <String>['Books'],
      'feed': <String, String>{'Top Free': 'top-free', 'Top Paid': 'top-paid'},
      'formant': <String, String>{'JSON': 'json'}
    },
    {
      'name': 'Audio Books',
      'types': <String>['Audio Books'],
      'feed': <String, String>{
        'Top': 'top',
        'Everyday listens for \$9.99.': '1355215958',
        '\$9.99 Fiction & Literature': '1461817928',
        '\$9.99 Mysteries & Thrillers': '1461817926',
        '\$9.99 Nonfiction': '1461817931',
        '\$9.99 Biographies & Memoirs': '1461817929',
        '\$9.99 Business & Self-Development': '1461817927',
        '\$9.99 Romance': '1461817933',
        '\$9.99 Sci-Fi & Fantasy': '1461817932',
        '\$9.99 Kids & Young Adults': '1461817930',
      },
      'formant': <String, String>{'JSON': 'json'},
    },
  ];

  selectNewMedia(String value1) {
    TypeList.value = mediaTypes.singleWhere(
        (element) => element['name'] == value1.toString())['types'];
    feedList.value = mediaTypes
        .singleWhere((element) => element['name'] == value1.toString())['feed'];
    selectedType.value = TypeList.value.first;
    selectedFeed.value = feedList.value.keys.first;
    selectedFormat.value = FormatList.value.keys.first;

    feedList.refresh();
    TypeList.refresh();
    FormatList.refresh();
  }
}
