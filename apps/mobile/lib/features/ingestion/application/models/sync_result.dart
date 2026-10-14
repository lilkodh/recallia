class SyncResult {
  final int successfulCount;
  final List<String> failedAssetIds;
  const SyncResult({
    required this.successfulCount,
    required this.failedAssetIds,
  });

  int get failedCount => failedAssetIds.length;
  bool get hasFailures => failedAssetIds.isNotEmpty;
}
