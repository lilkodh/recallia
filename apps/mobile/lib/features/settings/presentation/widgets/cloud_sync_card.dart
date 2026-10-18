import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/app_text_styles.dart';

class CloudSyncCard extends StatelessWidget {
  const CloudSyncCard({
    required this.isSyncEnabled,
    required this.isSyncRunning,
    required this.onChanged,
    super.key,
  });

  final bool isSyncEnabled;
  final bool isSyncRunning;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFEFEF), width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.cloud_queue_rounded, color: Color(0xFF1C1C1C), size: 22),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cloud sync (optional)',
                      style: AppTextStyles.title.copyWith(
                        color: const Color(0xFF1C1C1C), 
                        fontWeight: FontWeight.w700, 
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Back up and sync across devices',
                      style: AppTextStyles.caption.copyWith(
                        color: const Color(0xFF707070), 
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: isSyncEnabled,
                activeColor: AppColors.textOnDark,
                activeTrackColor: AppColors.switchcolor,
                onChanged: onChanged,
              ),
            ],
          ),
          if (isSyncEnabled) ...[
            const SizedBox(height: 14),
            const Divider(height: 1, color: Color(0xFFEFEFEF)),
            const SizedBox(height: 10),
            Row(
              children: [
                isSyncRunning
                    ? const SizedBox(
                        width: 14, 
                        height: 14, 
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.blue),
                      )
                    : const Icon(Icons.check_circle, color: Colors.green, size: 14),
                const SizedBox(width: 8),
                Text(
                  isSyncRunning ? 'Syncing processing pipeline...' : 'All memories safely backed up',
                  style: AppTextStyles.caption.copyWith(
                    color: isSyncRunning ? Colors.blue : Colors.green, 
                    fontWeight: FontWeight.w600, 
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
