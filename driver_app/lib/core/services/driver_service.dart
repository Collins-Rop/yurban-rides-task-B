import 'package:shared_preferences.dart';

class DriverService {
  static const String _isOnlineKey = 'isOnline';

  static Future<bool> toggleOnlineStatus(bool isOnline) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isOnlineKey, isOnline);
    return isOnline;
  }

  static Future<bool> getOnlineStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isOnlineKey) ?? false;
  }
}
