import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';

class ThankYouCreditCard extends StatelessWidget {
  const ThankYouCreditCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 320,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          SvgPicture.asset('assets/images/logo.svg'),
          const SizedBox(width: 16),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Credit Card',
                  style: Styles.style18,
                ),
                Text(
                  'Mastercard **78',
                  style: Styles.style16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
