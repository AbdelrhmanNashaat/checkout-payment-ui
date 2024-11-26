import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'payment_methods_list_view.dart';

class PaymentMethodModelSheet extends StatelessWidget {
  const PaymentMethodModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width / 6),
            child: const PaymentMethodsListView(),
          ),
          const SizedBox(height: 15),
          CustomButton(
            text: 'Continue',
            onTap: () {},
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
