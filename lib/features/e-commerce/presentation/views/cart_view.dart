import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/build_row.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/checkout_button.dart';
import 'package:planty/features/e-commerce/presentation/views/widgets/custom_cart_items.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String selectedLocation = 'Fayoum';
  final shippingFees = {
    'Fayoum': 2,
    'Cairo': 5,
    'Giza': 4,
    'Alexandria': 6,
  };

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    final subtotal = cartProvider.getTotalPrice();
    final shipping = shippingFees[selectedLocation] ?? 2;
    final total = subtotal + shipping;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        title: const Text(
          "Your Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const BackButton(),
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Cart items
            CustomCartItems(cartItems: cartItems, cartProvider: cartProvider),

            const SizedBox(height: 12),

            // Shipping dropdown
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Calculate Shipping",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButton<String>(
                      value: selectedLocation,
                      items: shippingFees.keys
                          .map((location) => DropdownMenuItem<String>(
                                value: location,
                                child: Text(location),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => selectedLocation = value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Order summary
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  BuildRow(
                      label: "Subtotal",
                      value: "\$${subtotal.toStringAsFixed(2)}"),
                  BuildRow(
                      label: "Shipping",
                      value: "\$${shipping.toStringAsFixed(2)}"),
                  const Divider(),
                  BuildRow(
                    label: "Total",
                    value: "\$${total.toStringAsFixed(2)}",
                    isBold: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Checkout button
            CheckoutButton(
              onTap: () {
                // TODO: Handle checkout logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Proceeding to checkout...")),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
