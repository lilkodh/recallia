import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/shared_preferences_cloud_sync_repository.dart';
import '../../domain/repositories/cloud_sync_preferences_repository.dart';

final cloudSyncPreferencesProvider = Provider<CloudSyncPreferencesRepository>((
  ref,
) {
  return SharedPreferencesCloudSyncRepository();
});
