import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/provider/discover_device_assets_provider.dart';

class IngestionTestScreen extends ConsumerStatefulWidget {
  const IngestionTestScreen({super.key});

  @override
  ConsumerState<IngestionTestScreen> createState() =>
      _IngestionTestScreenState();
}

class _IngestionTestScreenState
    extends ConsumerState<IngestionTestScreen> {
  String result = 'Press the button to discover photos.';

  Future<void> discoverPhotos() async {
    final discoverDeviceAssets = ref.read(
      discoverDeviceAssetsProvider,
    );

    final assets = await discoverDeviceAssets.execute();

    setState(() {
      result = 'Discovered ${assets.length} asset(s).';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingestion Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: discoverPhotos,
              child: const Text('Discover Photos'),
            ),
          ],
        ),
      ),
    );
  }
}