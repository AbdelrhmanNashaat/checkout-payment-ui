import 'dart:developer';

import 'package:checkout_payment_ui/Features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/payment_intent_input_model.dart';
import 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final CheckoutRepo checkoutRepo;
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());

    var data = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    data.fold(
      (failure) => emit(
        StripePaymentFailure(errorMessage: failure.errorMessage),
      ),
      (success) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log('state is : $change');
    super.onChange(change);
  }
}
