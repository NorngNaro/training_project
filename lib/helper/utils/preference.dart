
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;

  // * Authentication key
  static const keyAccessToken = 'accessToken';
  static const keyLogin = 'login';
  static const keyInitNotificationPage = 'notificationPage';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  // * Set persistent
  static Future saveAccessToken(String accessToken) async {
    await _preferences.setString(keyAccessToken, 'bearer $accessToken');
  }

  static Future saveInitNotification(int notificationType) async {
    await _preferences.setInt(keyInitNotificationPage, notificationType);
  }


  static Future saveLogin(bool loginParam) async {
    await _preferences.setBool(keyLogin, loginParam);
  }

  // * Get persistent
  static String? getAccessToken() {
    return _preferences.getString(keyAccessToken);
  }

  static bool? getLogin() {
    return _preferences.getBool(keyLogin);
  }

  static int? getInitNotificationPage() {
    return _preferences.getInt(keyInitNotificationPage);
  }


  // * Clear persistent
  static void clearCredential() {
    _preferences.remove(keyAccessToken);
  }

  static void clearLogin() {
    _preferences.remove(keyLogin);
  }

  // * Clear Init Notification Page
  static void clearInitNotificationPage() {
    _preferences.remove(keyInitNotificationPage);
  }

  // * Clear all persistent
  static void clearAll() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
