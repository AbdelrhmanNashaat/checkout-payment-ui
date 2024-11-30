import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/core/errors/failure.dart';
import 'package:checkout_payment_ui/core/utils/stripe_services.dart';
import 'package:dartz/dartz.dart';
import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeServices stripeServices;

  CheckoutRepoImpl({required this.stripeServices});
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeServices.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
