import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/app_text_styles.dart';
import 'package:mobile/core/widgets/app_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/ingestion/application/providers/photo_device_connector_provider.dart';
import 'package:mobile/features/ingestion/application/providers/discover_device_assets_provider.dart';
class PermissionsScreen extends ConsumerStatefulWidget {
  const PermissionsScreen({required this.onContinue, super.key});
  final VoidCallback onContinue;

  @override
  ConsumerState<PermissionsScreen> createState() => _PermissionsScreenState(); // 1. Changed State to ConsumerState
}

class _PermissionsScreenState extends ConsumerState<PermissionsScreen> { // 2. Changed State to ConsumerState
  bool _photosEnabled = false;
  bool _videosEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Let Recallia\nremember with you.',
                style: AppTextStyles.headline.copyWith(
                  color: AppColors.textOnDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Grant access to enable your memories. '
                'You can change these permissions at any time.',
                style: AppTextStyles.button.copyWith(
                  color: AppColors.textOnDark.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 30),

              _permissionRow(
                icon: Icons.photo_library_outlined,
                title: 'Photos',
                subtitle: 'Find your favorite moments.',
              ),

              const SizedBox(height: 14),

              _permissionRow(
                icon: Icons.videocam_outlined,
                title: 'Videos',
                subtitle: 'Rediscover moments in motion',
              ),

              const Spacer(),
              AppButton(label: 'Continue', onPressed: () async {
                if (!_photosEnabled && !_videosEnabled) return;
                await ref.read(discoverDeviceAssetsProvider).execute(
                  includePhotos: _photosEnabled,
                  includeVideos: _videosEnabled,
                );
                widget.onContinue;
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _permissionRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surface.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textOnDark, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.textOnDark,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  subtitle,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textOnDark.withValues(alpha: 0.65),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: title == 'Photos' ? _photosEnabled : _videosEnabled,
            activeThumbColor: AppColors.textOnDark,
            activeTrackColor: AppColors.switchcolor,
            inactiveThumbColor: AppColors.backgroundDark,
            inactiveTrackColor: AppColors.backgroundLight,

            onChanged: (value) async {
             if(title == 'Photos'){
              final granted = await ref
              .read(photoDeviceConnectorProvider)
              .requestPermission();
                 setState(()=> _photosEnabled = value && granted );

             } else {
  final granted = await ref
      .read(photoDeviceConnectorProvider)
      .requestPermission();

  setState(() => _videosEnabled = value && granted);
}
            },
          ),
        ],
      ),
    );
  }
}
