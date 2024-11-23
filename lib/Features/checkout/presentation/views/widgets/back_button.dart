import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackWidget extends StatelessWidget {
  const CustomBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/arrow.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
