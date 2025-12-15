import 'package:flutter/material.dart';

class ScanBottomScreen extends StatefulWidget {
  const ScanBottomScreen({super.key});

  @override
  State<ScanBottomScreen> createState() => _ScanBottomScreenState();
}

class _ScanBottomScreenState extends State<ScanBottomScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder Image Container
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.image, size: 80, color: Colors.grey),
          ),

          const SizedBox(height: 30),

          // Camera Button
          ElevatedButton.icon(
            onPressed: () {
              // Add Teachable Machine camera logic later
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text("Take Photo"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Gallery Button
          ElevatedButton.icon(
            onPressed: () {
              // Add Teachable Machine gallery logic later
            },
            icon: const Icon(Icons.photo_library),
            label: const Text("Pick from Gallery"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
