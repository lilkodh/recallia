import 'package:flutter/material.dart';

class HomeMemoryGrid extends StatelessWidget {
  const HomeMemoryGrid({
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: itemBuilder,
    );
  }
}