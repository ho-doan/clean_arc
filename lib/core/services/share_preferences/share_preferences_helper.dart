import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/v4.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper(this._pref);

  final SharedPreferences _pref;

  String? getUserName() {
    try {
      return _pref.getString('user');
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  String? getUserId() {
    try {
      return _pref.getString('user_id');
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  List<String> getPoints() {
    try {
      return _pref.getStringList('points') ?? [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> setUserName(String value) async {
    await _pref.setString('user', value);
  }

  Future<void> setUserId() async {
    final value = const UuidV4().generate();
    await _pref.setString('user_id', value);
  }

  Future<void> setPoint(String value) async {
    final points = getPoints();
    await _pref.setStringList('points', List.from(points)..add(value));
  }

  Future<void> cleanAllData() async {
    await _pref.clear();
  }
}
