import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBottomScreen extends StatelessWidget {
  const HomeBottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello Buddy 👋",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage("assets/images/batman.jpg"),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            "Sort waste the smart way",
            style: GoogleFonts.inter(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: "Search waste items",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),

          const SizedBox(height: 20),

          // Grid items
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              bool isRecyclable = index.isEven;

              return _buildWasteCard(
                image: isRecyclable
                    ? "assets/images/iron-man.jpg"
                    : "assets/images/groot.jpg",
                title: isRecyclable ? "Plastic Bottle" : "Food Wrapper",
                rating: isRecyclable ? "Recyclable" : "Non-Recyclable",
              );
            },
          ),
        ],
      ),
    );
  }

  // Item card
  Widget _buildWasteCard({
    required String image,
    required String title,
    required String rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.eco, size: 16, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(rating, style: const TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
