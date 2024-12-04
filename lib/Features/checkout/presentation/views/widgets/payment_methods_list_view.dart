import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatefulWidget {
  final Function({required int index}) updatePaymentMethod;
  const PaymentMethodsListView({super.key, required this.updatePaymentMethod});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: paymentMethodsItems.asMap().entries.map((entry) {
          final index = entry.key;
          final image = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
                widget.updatePaymentMethod(index: index);
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                image: image,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
