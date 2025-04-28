import 'package:flutter/material.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';
import 'package:provider/provider.dart';

Future<String?> editAddressDialog(
    BuildContext context, String currentAddress) async {
  final TextEditingController controller =
      TextEditingController(text: currentAddress);
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Edit Delivery Address"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter your address"),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text("Save")),
        ],
      );
    },
  );
}

Future<void> confirmOrderDialog(
  BuildContext context,
  String address,
  String paymentMethod,
  double subtotal,
  int shipping,
  double total,
) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Confirm Order"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery Address: $address"),
          Text("Payment Method: $paymentMethod"),
          const SizedBox(height: 8),
          Text("Subtotal: \$${subtotal.toStringAsFixed(2)}"),
          Text("Shipping: \$${shipping.toStringAsFixed(2)}"),
          Text("Total: \$${total.toStringAsFixed(2)}"),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel")),
        TextButton(
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false).clearCart();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationView(
                  myCurrentIndex: 2,
                ),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Order Confirmed!")),
            );
          },
          child: const Text("Confirm"),
        ),
      ],
    ),
  );
}
