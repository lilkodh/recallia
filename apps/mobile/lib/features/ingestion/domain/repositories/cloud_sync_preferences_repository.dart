abstract interface class CloudSyncPreferencesRepository {
  Future<bool> isEnabled();
  Future<void> setEnabled(bool enabled);
}
