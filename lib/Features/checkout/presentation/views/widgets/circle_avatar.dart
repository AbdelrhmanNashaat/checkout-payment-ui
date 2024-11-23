import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 26,
      left: 0,
      right: 0,
      child: Center(
        child: CircleAvatar(
          radius: 55,
          backgroundColor: const Color(0xffD9D9D9),
          child: CircleAvatar(
            radius: 44,
            backgroundColor: const Color(0xff34A853),
            child: SvgPicture.asset('assets/images/Vector 11.svg'),
          ),
        ),
      ),
    );
  }
}
