import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

part 'cache_keys.dart';

class CacheHelper {
  static final CacheHelper _instance = CacheHelper._();

  CacheHelper._();

  factory CacheHelper() => _instance;

  // SharedPreferences instance
  static late SharedPreferences _sharedPreferences;

  // Initialize SharedPreferences and set default values.
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (get<String>(CacheKeys.lang) == null) {
      await save(CacheKeys.theme, CacheKeys.langEn);
    }
    if (get<String>(CacheKeys.theme) == null) {
      await save(CacheKeys.theme, CacheKeys.light);
    }
    if (get<bool>(CacheKeys.skippedOnboarding) == null) {
      await save(CacheKeys.skippedOnboarding, false);
    }
  }

  // Save a value to SharedPreferences based on its type.
  static Future<bool> save(String key, dynamic value) async {
    try {
      if (value is String) {
        return await _sharedPreferences.setString(key, value);
      } else if (value is int) {
        return await _sharedPreferences.setInt(key, value);
      } else if (value is bool) {
        return await _sharedPreferences.setBool(key, value);
      } else if (value is double) {
        return await _sharedPreferences.setDouble(key, value);
      } else {
        debugPrint('Unsupported type: ${value.runtimeType}');
        return false;
      }
    } catch (e) {
      debugPrint('Error saving value: $e');
      return false;
    }
  }

  // Retrieve a value from SharedPreferences.
  static T? get<T>(String key) {
    try {
      return _sharedPreferences.get(key) as T?;
    } catch (e) {
      debugPrint('Error retrieving value: $e');
      return null;
    }
  }

  // Remove a value from SharedPreferences.
  static Future<bool> remove(String key) async {
    try {
      return await _sharedPreferences.remove(key);
    } catch (e) {
      debugPrint('Error removing value: $e');
      return false;
    }
  }

  // Remove multiple values from SharedPreferences.
  static Future<void> removeList(List<String> keys) async {
    try {
      for (final key in keys) {
        await _sharedPreferences.remove(key);
      }
    } catch (e) {
      debugPrint('Error removing list of values: $e');
    }
  }

  // Save a map of key-value pairs to SharedPreferences.
  static Future<bool> saveMap(Map<String, dynamic> data) async {
    try {
      for (final entry in data.entries) {
        final key = entry.key;
        final value = entry.value;

        if (value is String) {
          await _sharedPreferences.setString(key, value);
        } else if (value is int) {
          await _sharedPreferences.setInt(key, value);
        } else if (value is bool) {
          await _sharedPreferences.setBool(key, value);
        } else if (value is double) {
          await _sharedPreferences.setDouble(key, value);
        } else {
          debugPrint('Unsupported type for key $key: ${value.runtimeType}');
        }
      }
      return true;
    } catch (e) {
      debugPrint('Error saving map: $e');
      return false;
    }
  }
}
