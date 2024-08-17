import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class AppStorage {
  /// Initialize the Hive storage
  static Future<void> initAppStorage() async {
    await Hive.initFlutter();
    await openHiveBox<dynamic>(BoxName.settings);
    await createAndOpenEncryptedBox<dynamic>();
  }

  static T? get<T>(dynamic key, {T? defaultValue}) {
    final box = Hive.box<dynamic>(BoxName.settings);
    return box.get(key, defaultValue: defaultValue) as T?;
  }

  static void save<T>(dynamic key, T value) {
    Hive.box<dynamic>(BoxName.settings).put(key, value);
  }

  static void delete(dynamic key) {
    Hive.box<dynamic>(BoxName.settings).delete(key);
  }

  static void deleteAll(Iterable<dynamic> keys) {
    Hive.box<dynamic>(BoxName.settings).deleteAll(keys);
  }

  static void clear<T>() {
    Hive.box<dynamic>(BoxName.settings).clear();
  }

  // Secure storage to store sensitive information
  static void saveSecure<T>(dynamic key, T value) {
    Hive.box<dynamic>(BoxName.secured).put(key, value);
  }

  static T? getSecure<T>(String key) {
    return Hive.box<dynamic>(BoxName.secured).get(key) as T;
  }

  static void deleteSecure(String key) {
    Hive.box<dynamic>(BoxName.secured).delete(key);
  }

  static void clearSecure() {
    Hive.box<dynamic>(BoxName.secured).clear();
  }
}

Future<void> openHiveBox<T>(String boxName,
    {HiveCipher? encryptionCipher, bool limit = false}) async {
  final box = await Hive.openBox<T>(boxName).onError(
    (error, stackTrace) async {
      final dir = await getApplicationDocumentsDirectory();
      final dirPath = dir.path;
      var dbFile = File('$dirPath/$boxName.hive');
      var lockFile = File('$dirPath/$boxName.lock');
      await dbFile.delete();
      await lockFile.delete();
      await Hive.openBox<T>(boxName, encryptionCipher: encryptionCipher);
      throw ArgumentError('Failed to open $boxName Box\nError: $error');
    },
  );
  // clear box if it grows large
  if (limit && box.length > 500) {
    await box.clear();
  }
}

// Storing sensitive information with encrypted boxes
Future<void> createAndOpenEncryptedBox<T>() async {
  const secureStorage = FlutterSecureStorage();
  final encryptionKeyString = await secureStorage.read(key: 'key');

  if (encryptionKeyString == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(key: 'key', value: base64UrlEncode(key));
  }

  final key = await secureStorage.read(key: 'key');
  final encryptionKey = base64Url.decode(key ?? '');

  await openHiveBox<T>(BoxName.secured,
      encryptionCipher: HiveAesCipher(encryptionKey));
}

class BoxName {
  static const String settings = 'settingsBox';
  static const String secured = 'securedBox';
}
