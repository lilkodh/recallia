import 'package:flutter/material.dart';

class MemorySearchIllustration extends StatelessWidget {
  const MemorySearchIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 30,
                child: Transform.rotate(
                  angle: -0.35,
                  child: const _PolaroidCard(
                    imageAsset: 'assets/images/japan_street.png',
                  ),
                ),
              ),
              Positioned(
                child: Transform.rotate(
                  angle: -0.05,

                  child: const _PolaroidCard(
                    imageAsset: 'assets/images/cafe_interior.png',
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 70,
                child: Transform.rotate(
                  angle: 0.45,
                  child: const _PolaroidCard(
                    imageAsset: 'assets/images/mountain_lake.png',
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 3),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(99),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.black45, size: 22),
              SizedBox(width: 2),
              Text(
                'Ask Recallia anything...',
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildChip('photos from Japan'),
            _buildChip('what did I do last Friday?'),
            _buildChip('documents about React Native'),
            _buildChip('when did I last see Ahmed?'),
          ],
        ),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _PolaroidCard extends StatelessWidget {
  final String imageAsset;
  const _PolaroidCard({required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.fromLTRB(6, 6, 6, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        width: 98,
        height: 85,
        color: Colors.grey.shade300,
        child: Image.asset(imageAsset, fit: BoxFit.cover),
      ),
    );
  }
}
