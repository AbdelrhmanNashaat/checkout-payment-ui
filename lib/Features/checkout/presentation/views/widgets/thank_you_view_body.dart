import 'package:flutter/material.dart';
import 'back_button.dart';
import 'circle_avatar.dart';
import 'circle_ticket.dart';
import 'custom_container.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 20),
            CustomBackWidget(),
            SizedBox(height: 30),
            CustomContainer(),
          ],
        ),
        CustomCircleAvatar(),
        CustomCircleTicket(left: 6),
        CustomCircleTicket(left: 363),
      ],
    );
  }
}
