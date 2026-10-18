enum DeviceAssetType { photo, video, document, audio, screenshot }

class DeviceAsset {
  final String externalId;
  final DeviceAssetType sourceType;
  final String sourcePath;
  final DateTime occurredAt;
  DateTime modifiedAt;
  final Map<String, dynamic> metadata;
  DeviceAsset({
    required this.externalId,
    required this.sourceType,
    required this.sourcePath,
    required this.occurredAt,
    required this.modifiedAt,
    required this.metadata,
  });
}
