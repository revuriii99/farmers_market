import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_provider.dart';

class DetailScreen extends StatelessWidget {
  final String productName;
  final String imagePath;

  const DetailScreen({
    super.key,
    required this.productName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final isInCart = context.watch<AppProvider>().isInCart(productName);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  productName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const Text(
                  "Organic & Fresh",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.green),
                ),
                const Text(
                  "Our farmers guarantee that this product is grown with love and without harmful chemicals.",
                  style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isInCart ? Colors.grey : Colors.green.shade700,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      if (isInCart) {
                        context.read<AppProvider>().removeFromCart(productName);
                      } else {
                        context.read<AppProvider>().addToCart(productName);
                      }
                    },
                    child: Text(
                      isInCart ? "Remove from Cart" : "Add to Cart",
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}