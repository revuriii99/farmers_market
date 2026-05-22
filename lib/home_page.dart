import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_card.dart';
import 'product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Farmers",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [

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
                  children: const [
                    CategoryCard(title: 'Fruits', imagePath: 'assets/res/fruits.png'),
                    CategoryCard(title: 'Grains', imagePath: 'assets/res/grains.png'),
                    CategoryCard(title: 'Herbs', imagePath: 'assets/res/herbs.png'),
                    CategoryCard(title: 'Milk', imagePath: 'assets/res/milk.png'),
                  ],
                ),
              ),

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
                  ProductCard(title: 'Berries', description: '...', imagePath: 'assets/res/berry.png'),
                  ProductCard(title: 'Tulsi', description: '...', imagePath: 'assets/res/tulsi.png'),
                  ProductCard(title: 'Milk', description: '...', imagePath: 'assets/res/milk.png'),
                  ProductCard(title: 'Tomato', description: '...', imagePath: 'assets/res/tomato.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}