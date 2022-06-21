import 'package:flutter_learn_project/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) {
      throw SharedNotInitialize();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> values) async {
    _checkPreferences();
    await preferences?.setStringList(key.name, values);
  }

  List<String>? getStringItems(SharedKeys key) {
    _checkPreferences();
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    final String? counter = preferences?.getString(key.name);
    return counter;
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}
