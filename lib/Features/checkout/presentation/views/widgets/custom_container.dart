import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/total_price_widget.dart';
import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'cart_info_item.dart';
import 'dotted_line.dart';
import 'thank_you_card.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 672,
          width: 360,
          decoration: const BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text('Thank you!', style: Styles.style25),
              const SizedBox(height: 6),
              Text('Your transaction was successful', style: Styles.style20),
              const SizedBox(height: 40),
              OrderInfoItem(
                title: 'Date',
                value:
                    '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
              ),
              const SizedBox(height: 20),
              OrderInfoItem(
                title: 'Time',
                value:
                    '${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().hour > 12 ? 'PM' : 'AM'}',
              ),
              const SizedBox(height: 20),
              const OrderInfoItem(
                title: 'To',
                value: 'John Doe',
              ),
              const Divider(
                thickness: 3,
                height: 50,
                color: Color(0xffC7C7C7),
              ),
              const TotalPrice(
                title: 'Total',
                value: '\$ 50.97',
              ),
              const SizedBox(height: 30),
              const ThankYouCreditCard(),
              const SizedBox(height: 60),
              const DottedLine(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/images/Vector.svg'),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      border: Border.all(
                        color: const Color(0xff34A853),
                        width: 1.5,
                      ),
                    ),
                    child: const Text('Paid', style: Styles.style24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
