import 'package:mobile/core/network/api_client.dart';
import 'package:mobile/core/device/installation_id_service.dart';

import '../../domain/entities/device_asset.dart';

class IngestionApiService {
  final ApiClient _apiClient;
  final InstallationIdService _installationIdService;

  IngestionApiService({
    required ApiClient apiClient,
    required InstallationIdService installationIdService,
  }) : _apiClient = apiClient,
        _installationIdService = installationIdService;

  Future<void> ingest(DeviceAsset asset) async {
    final deviceId = await _installationIdService.getInstallationId();

    await _apiClient.post('/ingestion/items', {
      'deviceId': deviceId,
      'sourceType': asset.sourceType.name,
      'externalId': asset.externalId,
      'sourcePath': asset.sourcePath,
      'occurredAt': asset.occurredAt.toIso8601String(),
    });
  }
}
