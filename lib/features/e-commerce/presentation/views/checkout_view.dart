import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/checkout_utils.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/confirm_order_button.dart';

class CheckoutView extends StatefulWidget {
  final double subtotal;
  final int shipping;
  final double total;
  final String shippingLocation;

  const CheckoutView({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.shippingLocation,
  });

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late String deliveryAddress;
  late String phoneNumber;
  String paymentMethod = "Cash";
  final List<String> paymentMethods = ["Cash", "Credit Card", "PayPal"];

  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    deliveryAddress = widget.shippingLocation;
    phoneController = TextEditingController(); // initialize controller
  }

  @override
  void dispose() {
    phoneController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Delivery Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(deliveryAddress)),
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      final updatedAddress =
                          await editAddressDialog(context, deliveryAddress);
                      if (updatedAddress != null && updatedAddress.isNotEmpty) {
                        setState(() => deliveryAddress = updatedAddress);
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Phone Number",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter your phone number",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ), // customize color if needed
                ),
              ),
              maxLength: 15, // optional, restrict length
            ),
            const SizedBox(height: 20),
            const Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: paymentMethod,
                  items: paymentMethods
                      .map(
                        (method) => DropdownMenuItem(
                          value: method,
                          child: Text(method),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => paymentMethod = value);
                    }
                  },
                ),
              ),
            ),
            const Spacer(),
            ConfirmOrderButton(
              onTap: () {
                if (phoneController.text.isEmpty ||
                    phoneController.text.length < 11) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid phone number.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                confirmOrderDialog(
                  context,
                  deliveryAddress,
                  paymentMethod,
                  widget.subtotal,
                  widget.shipping,
                  widget.total,
                  phoneController
                      .text, // optional: pass phone number to the dialog
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
