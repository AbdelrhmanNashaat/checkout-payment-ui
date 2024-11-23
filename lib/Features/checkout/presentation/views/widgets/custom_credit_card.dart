import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autovalidateMode});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {},
          enableFloatingCard: true,
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (creditCardModel) {
            cardHolderName = creditCardModel.cardHolderName;
            expiryDate = creditCardModel.expiryDate;
            cvvCode = creditCardModel.cvvCode;
            cardNumber = creditCardModel.cardNumber;
            showBackView = creditCardModel.isCvvFocused;
            setState(() {});
          },
          autovalidateMode: widget.autovalidateMode,
          formKey: widget.formKey,
          inputConfiguration: InputConfiguration(
            cardNumberDecoration: InputDecoration(
              border: border(),
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: InputDecoration(
              border: border(),
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: InputDecoration(
              border: border(),
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: InputDecoration(
              border: border(),
              labelText: 'Card Holder',
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
