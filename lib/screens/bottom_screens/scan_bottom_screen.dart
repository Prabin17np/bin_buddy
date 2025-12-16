import 'package:flutter/material.dart';

class ScanBottomScreen extends StatelessWidget {
  const ScanBottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.image, size: 80),
          ),

          const SizedBox(height: 30),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
            label: const Text("Take Photo"),
          ),

          const SizedBox(height: 10),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.photo_library),
            label: const Text("Pick from Gallery"),
          ),
        ],
      ),
    );
  }
}
