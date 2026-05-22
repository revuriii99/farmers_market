import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        height: 56,
        width: 130,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade300 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          spacing: 8,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: ShapeDecoration(
                color: Color(0xFFC4C4C4),
                shape: OvalBorder(),
              ),
              child: ClipOval(
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: const Color(0xFF505050),
                fontSize: 15,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}