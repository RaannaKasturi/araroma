import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryCard extends StatelessWidget {
  const ShimmerCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            Container(
              height: 16,
              width: 100,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
