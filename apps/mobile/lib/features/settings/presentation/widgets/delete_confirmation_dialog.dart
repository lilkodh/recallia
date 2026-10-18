import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'Delete all data?', 
        style: TextStyle(color: Color(0xFF1C1C1C), fontWeight: FontWeight.w700),
      ),
      content: const Text('This will permanently erase all local memories from your phone. This cannot be undone.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            'Delete Everything', 
            style: TextStyle(color: Color(0xFF8B2525), fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
