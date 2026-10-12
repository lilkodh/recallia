import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/discover_device_assets_provider.dart';
import '../../application/providers/device_asset_repository_provider.dart';

class IngestionTestScreen extends ConsumerStatefulWidget {
  const IngestionTestScreen({super.key});

  @override
  ConsumerState<IngestionTestScreen> createState() =>
      _IngestionTestScreenState();
}

class _IngestionTestScreenState extends ConsumerState<IngestionTestScreen> {
  String result = 'Press the button to test asset retrieval.';
  bool isLoading = false;

  Future<void> testAssetRetrieval() async {
    setState(() {
      isLoading = true;
      result = 'Discovering and saving assets...';
    });

    try {
      final discoverAssets = ref.read(discoverDeviceAssetsProvider);
      final repository = ref.read(deviceAssetRepositoryProvider);

      // 1. Discover device assets and save them to SQLite.
      final discoveredAssets = await discoverAssets.execute();

      // 2. Read the saved assets back from SQLite.
      final retrievedAssets = await repository.getAll();

      // 3. Count the records stored in SQLite.
      final storedCount = await repository.count();

      if (!mounted) return;

      setState(() {
        result =
            'Discovery and retrieval successful!\n\n'
            'Discovered: ${discoveredAssets.length}\n'
            'Retrieved from SQLite: ${retrievedAssets.length}\n'
            'Stored in SQLite: $storedCount\n\n'
            'First retrieved asset:\n'
            '${retrievedAssets.isNotEmpty ? retrievedAssets.first.externalId : "No assets found"}';
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        result = 'Test failed:\n$error';
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Retrieval Test'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isLoading ? null : testAssetRetrieval,
                child: Text(
                  isLoading ? 'Testing...' : 'Test Asset Retrieval',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}