import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/database_provider.dart';
import '../../data/repositories/drift_device_asset_repository.dart';

final deviceAssetRepositoryProvider =
    Provider<DriftDeviceAssetRepository>((ref) {
  final database = ref.watch(databaseProvider);

  return DriftDeviceAssetRepository(database);
});