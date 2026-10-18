import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/cloud_sync_preferences_repository.dart';

class SharedPreferencesCloudSyncRepository
    implements CloudSyncPreferencesRepository {
  static const String _storageKey = 'cloud_sync_enabled';

  @override
  Future<bool> isEnabled() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_storageKey) ?? false;
  }

  @override
  Future<void> setEnabled(bool enabled) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_storageKey, enabled);
  }
}
