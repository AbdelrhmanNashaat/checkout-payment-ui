import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/api_services.dart';
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
}
