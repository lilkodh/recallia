import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_text_styles.dart';

class LocalDeviceCard extends StatelessWidget {
  const LocalDeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F1EC), // Soft light-tan background from mockup
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.shield_outlined, color: Color(0xFF1C1C1C), size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Local on this device',
                  style: AppTextStyles.title.copyWith(
                    color: const Color(0xFF1C1C1C), 
                    fontWeight: FontWeight.w700, 
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Memories stay on your phone.\nNo cloud storage required.',
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF707070), 
                    fontSize: 12, 
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
