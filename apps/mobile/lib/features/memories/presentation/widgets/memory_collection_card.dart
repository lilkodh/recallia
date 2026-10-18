import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/app_text_styles.dart';

class MemoryCollectionCard extends StatelessWidget {
  const MemoryCollectionCard({
    super.key,
    required this.title,
    required this.memoryCount,
    this.cover,
    this.onTap,
  });

  final String title;
  final int memoryCount;
  final Widget? cover;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryText.withValues(alpha: 0.15),
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: cover ??
                      Container(
                        color: AppColors.backgroundDark.withValues(alpha: 0.08),
                        child: const Center(
                          child: Icon(Icons.photo_outlined, size: 36),
                        ),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 2),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(
                  '$memoryCount ${memoryCount == 1 ? 'memory' : 'memories'}',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}