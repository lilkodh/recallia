import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_text_styles.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/features/home/presentation/widgets/home_section_header.dart';
import 'package:mobile/features/ingestion/application/providers/discover_device_assets_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/ingestion/domain/entities/device_asset.dart';
import 'package:mobile/features/home/presentation/widgets/home_memory_grid.dart';
import 'package:mobile/features/home/presentation/widgets/home_memory_tile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<DeviceAsset> _memories = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMemories();
  }

  Future<void> _loadMemories() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final memories = await ref.read(discoverDeviceAssetsProvider).execute();

      if (!mounted) return;

      setState(() {
        _memories = memories;
        _isLoading = false;
      });
    } catch (error, stackTrace) {
      debugPrint('Failed to load home memories: $error');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Good evening',
                style: AppTextStyles.headline.copyWith(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Your life, fine remembered.',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 26),
              HomeSectionHeader(
                title: 'Recent memories',
                actionLabel: 'See all',
                onAction: () {},
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildGridContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_memories.isEmpty) {
      return Text(
        'Your memories will appear here.',
        style: AppTextStyles.caption.copyWith(color: AppColors.secondaryText),
      );
    }

    return HomeMemoryGrid(
      itemCount: _memories.length > 4 ? 4 : _memories.length,
      itemBuilder: (context, index) {
        return HomeMemoryTile(assetId: _memories[index].externalId);
      },
    );
  }
}