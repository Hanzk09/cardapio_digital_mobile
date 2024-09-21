import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getToken() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString('token');
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token);
  }
}
