import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/app_text_styles.dart';
import 'package:mobile/features/ingestion/application/providers/discover_device_assets_provider.dart';
import 'package:mobile/features/ingestion/domain/entities/device_asset.dart';

import 'package:photo_manager/photo_manager.dart';
import 'package:mobile/features/memories/presentation/widgets/memory_collection_card.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class MemoriesScreen extends ConsumerStatefulWidget {
  const MemoriesScreen({super.key});

  @override
  ConsumerState<MemoriesScreen> createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends ConsumerState<MemoriesScreen> {
  List<DeviceAsset> _memories = [];
  final Map<String, AssetType> _assetTypes = {};

  bool _isLoading = true;
  String _selectedFilter = 'All';
  @override
  void initState() {
    super.initState();
    _loadMemories();
  }

  Future<void> _loadMemories() async {
    try {
      final memories = await ref.read(discoverDeviceAssetsProvider).execute();

      final assetTypes = <String, AssetType>{};

      for (final memory in memories) {
        final asset = await AssetEntity.fromId(memory.externalId);

        if (asset != null) {
          assetTypes[memory.externalId] = asset.type;
        }
      }

      if (!mounted) return;

      setState(() {
        _memories = memories;
        _assetTypes
          ..clear()
          ..addAll(assetTypes);
        _isLoading = false;
      });
    } catch (error, stackTrace) {
      debugPrint('Failed to load memories: $error');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildFilterChips() {
    const filters = ['All', 'Photos', 'Videos'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter;

          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ChoiceChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (_) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              backgroundColor: AppColors.surface,
              selectedColor: AppColors.backgroundDark,
              labelStyle: AppTextStyles.caption.copyWith(
                color: isSelected
                    ? AppColors.textOnDark
                    : AppColors.secondaryText,
              ),
              shape: const StadiumBorder(),
              side: BorderSide.none,
              showCheckmark: false,
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Memories',
                      style: AppTextStyles.headline.copyWith(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Search action will be connected later.
                    },
                    icon: const Icon(Icons.search_rounded),
                    color: AppColors.primaryText,
                    visualDensity: VisualDensity.compact,
                  ),
                  IconButton(
                    onPressed: () {
                      // Add-memory action will be connected later.
                    },
                    icon: const Icon(Icons.add_rounded),
                    color: AppColors.primaryText,
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),

              const SizedBox(height: 16), // Added spacing
              _buildFilterChips(), // Step 3: Inserted the filter chips right here
              const SizedBox(height: 24), // Added spacing before grid lists

              Expanded(child: _buildMemoriesContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemoriesContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_memories.isEmpty) {
      return Center(
        child: Text(
          'No memories found yet.',
          style: AppTextStyles.body.copyWith(color: AppColors.secondaryText),
        ),
      );
    }
    final filteredMemories = _memories.where((memory) {
      final type = _assetTypes[memory.externalId];

      switch (_selectedFilter) {
        case 'Photos':
          return type == AssetType.image;

        case 'Videos':
          return type == AssetType.video;

        case 'Documents':
          return false;

        case 'All':
        default:
          return true;
      }
    }).toList();

    if (filteredMemories.isEmpty) {
      return Center(
        child: Text(
          'No ${_selectedFilter.toLowerCase()} found.',
          style: AppTextStyles.body.copyWith(color: AppColors.secondaryText),
        ),
      );
    }

    return GridView.builder(
      itemCount: filteredMemories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 18,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final memory = filteredMemories[index];

        return FutureBuilder<AssetEntity?>(
          future: AssetEntity.fromId(memory.externalId),
          builder: (context, snapshot) {
            final asset = snapshot.data;

            return MemoryCollectionCard(
              title: asset?.title ?? 'Memory ${index + 1}',
              memoryCount: 1,
              cover: asset == null
                  ? null
                  : AssetEntityImage(
                      asset,
                      isOriginal: false,
                      thumbnailSize: const ThumbnailSize(500, 500),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox.shrink(),
                    ),
            );
          },
        );
      },
    );
  }
}
