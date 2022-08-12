import 'package:ayati/Model/mushaf.dart';
import 'package:ayati/choose_mushaf.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  static SharedPreferences? prefs ;
  static int? mark = 0;
  static int? choosedMushafIndex;
  static Mushaf? choosedMushaf;

  static Future<void> getPreferences() async {
    print('====PerfService.getPreferences====');
    prefs = await SharedPreferences.getInstance();
    mark = await prefs?.getInt('mark');
    print('mark = ${mark}');
    choosedMushafIndex = await prefs?.getInt('mushaf') ?? 0;
    print('choosedMushafIndex = ${choosedMushafIndex}');
    choosedMushaf = ChooseMushaf.mushafs[choosedMushafIndex!];
  }

  static Future<void> setMark(int index) async{
    mark = index;
    await prefs?.setInt('mark', mark!);
  }

  static Future<void> setMushaf(int index) async{
    choosedMushafIndex = index;
    await prefs?.setInt('mushaf', choosedMushafIndex!);
  }
}