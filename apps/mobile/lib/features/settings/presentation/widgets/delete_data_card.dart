import 'package:flutter/material.dart';

class DeleteDataCard extends StatelessWidget {
  const DeleteDataCard({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F1EC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        title: const Text(
          'Delete all data',
          style: TextStyle(
            color: Color(0xFF8B2525), 
            fontWeight: FontWeight.w700, 
            fontSize: 15,
          ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF8B2525), size: 24),
        onTap: onTap,
      ),
    );
  }
}
