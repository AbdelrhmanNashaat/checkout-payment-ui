import 'dart:developer';
import 'package:checkout_payment_ui/Features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_state.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const ThankYouView(),
            ),
          );
        }
        if (state is StripePaymentFailure) {
          log('Error: ${state.errorMessage}');
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Continue',
          isLoading: state is StripePaymentLoading ? true : false,
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '100',
              currency: 'USD',
              customerId: 'cus_RKbY3DsciPTW7m',
            );
            context.read<StripePaymentCubit>().makePayment(
                  paymentIntentInputModel: paymentIntentInputModel,
                );
          },
        );
      },
    );
  }
}
