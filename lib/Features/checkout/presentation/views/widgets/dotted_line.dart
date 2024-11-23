import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          18,
          (index) {
            return Container(
              height: 4,
              width: 8,
              decoration: BoxDecoration(
                color: const Color(0xffB8B8B8),
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        ),
      ),
    );
  }
}
