import 'package:shared_preferences.dart';

class AuthService {
  static const String _phoneKey = 'phone';
  static const String _isLoggedInKey = 'isLoggedIn';

  // Mock user data for testing
  static final Map<String, String> _mockUsers = {
    '0734567890': '1234',
    '0712345678': '5678',
  };

  static Future<bool> login(String phone, String pin) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Check if credentials match mock data
    if (_mockUsers[phone] == pin) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoggedInKey, true);
      await prefs.setString(_phoneKey, phone);
      return true;
    }
    return false;
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<String?> getLoggedInPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_phoneKey);
  }
}
