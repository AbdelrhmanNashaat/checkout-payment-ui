import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/api_services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../Features/checkout/data/models/payment_intent_input_model.dart';
import '../../Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeServices {
  final ApiServices apiServices = ApiServices();

  // Create PaymentIntent
  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiServices.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
      body: paymentIntentInputModel.toJson(),
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  // init payment Sheet
  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Abdelrhman',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  // Display payment Sheet
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // make payment
  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntent = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntent.clientSecret!);
    await displayPaymentSheet();
  }
}
