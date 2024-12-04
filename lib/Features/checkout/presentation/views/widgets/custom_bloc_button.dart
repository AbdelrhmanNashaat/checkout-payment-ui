import 'dart:developer';
import 'package:checkout_payment_ui/Features/checkout/data/models/paypal_amount_model/paypal_amount_model.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_state.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/payment_intent_input_model.dart';
import '../../../data/models/paypal_amount_model/details.dart';
import '../../../data/models/paypal_items_model/item.dart';
import '../../../data/models/paypal_items_model/paypal_items_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  final bool isPaypal;
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
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
            if (!isPaypal) {
              creditMethod(context);
            } else {
              paypalPayMethod(context);
            }
          },
        );
      },
    );
  }

  void creditMethod(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '150',
      currency: 'USD',
      customerId: 'cus_RKbY3DsciPTW7m',
    );
    context.read<StripePaymentCubit>().makePayment(
          paymentIntentInputModel: paymentIntentInputModel,
        );
  }

  void paypalPayMethod(BuildContext context) {
    var transactionData = getTransaction();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.secretKeyPaypal,
          transactions: [
            {
              "amount": transactionData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const ThankYouView(),
              ),
            );
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  // Record
  ({PaypalAmountModel amount, PaypalItemsModel itemList}) getTransaction() {
    var amountModel = PaypalAmountModel(
      total: "150",
      currency: "USD",
      details: Details(
        subtotal: "150",
        shipping: "0",
        shippingDiscount: 0,
      ),
    );
    List<Item> items = [
      Item(
        name: "Apple",
        quantity: 9,
        price: '10',
        currency: "USD",
      ),
      Item(
        name: "Pineapple",
        quantity: 5,
        price: '12',
        currency: "USD",
      ),
    ];
    var itemList = PaypalItemsModel(items: items);
    return (amount: amountModel, itemList: itemList);
  }
}
