import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_card.dart';
import 'product_card.dart';
import 'app_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Farmers",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
              if (provider.cartCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${provider.cartCount}',
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              // SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  hintText: 'Search..',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF505050),
                  ),
                  fillColor: const Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),

              // HERO BANNER
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/res/grains.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // CATEGORIES
              Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12,
                  children: [
                    'Fruits', 'Grains', 'Herbs', 'Milk',
                  ].map((category) => CategoryCard(
                    title: category,
                    imagePath: 'assets/res/${category.toLowerCase()}.png',
                    isSelected: provider.selectedCategory == category,
                    onTap: () => context.read<AppProvider>().selectCategory(category),
                  )).toList(),
                ),
              ),

              // BROWSE PRODUCTS
              const Text(
                'Browse Products',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),

              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 260,
                ),
                children: const [
                  ProductCard(title: 'Berries', description: 'Berries is a sweet fruit with red color.', imagePath: 'assets/res/berry.png'),
                  ProductCard(title: 'Tulsi', description: 'Leaf of berries is very green and fresh.', imagePath: 'assets/res/tulsi.png'),
                  ProductCard(title: 'Milk', description: 'Milk is a white liquid produced by mammals.', imagePath: 'assets/res/milk.png'),
                  ProductCard(title: 'Tomato', description: 'Tomato is a fruit or a vegetable?', imagePath: 'assets/res/tomato.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}