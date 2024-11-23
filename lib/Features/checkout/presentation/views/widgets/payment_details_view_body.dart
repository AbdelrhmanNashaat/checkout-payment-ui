import 'package:checkout_payment_ui/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 15)),
        const SliverToBoxAdapter(child: PaymentMethodsListView()),
        const SliverToBoxAdapter(child: SizedBox(height: 15)),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: _formKey,
            autovalidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: CustomButton(
                text: 'Pay',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ThankYouView(),
                      ),
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
