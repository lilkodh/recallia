import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class HomeMemoryTile extends StatefulWidget {
  const HomeMemoryTile({
    required this.assetId,
    super.key,
  });

  final String assetId;

  @override
  State<HomeMemoryTile> createState() => _HomeMemoryTileState();
}

class _HomeMemoryTileState extends State<HomeMemoryTile> {
  late final Future<AssetEntity?> _assetFuture;

  @override
  void initState() {
    super.initState();
    _assetFuture = AssetEntity.fromId(widget.assetId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AssetEntity?>(
      future: _assetFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        }

        final asset = snapshot.data;
        if (asset == null) {
          return const SizedBox.shrink();
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AssetEntityImage(
            asset,
            isOriginal: false,
            thumbnailSize: const ThumbnailSize(400, 400),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
