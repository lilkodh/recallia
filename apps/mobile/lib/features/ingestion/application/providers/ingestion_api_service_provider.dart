import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/ingestion_api_service.dart';

import 'package:mobile/core/device/installation_id_service.dart';
import 'package:mobile/core/providers/api_client_provider.dart';

final installationIdServiceProvider = Provider<InstallationIdService>((ref) {
  return InstallationIdService();
});
final ingestionApiServiceProvider = Provider<IngestionApiService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final installationIdService = ref.watch(installationIdServiceProvider);

  return IngestionApiService(
    apiClient: apiClient,
    installationIdService: installationIdService,
  );
});
