import 'package:flutter/material.dart';

class HomeBottomScreen extends StatelessWidget {
  const HomeBottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bin Buddy"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome 👋",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 8),

            Text(
              "Choose an option below to continue",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 30),

            // Home Buttons
            ElevatedButton(onPressed: () {}, child: const Text("Scan Item")),

            const SizedBox(height: 12),

            ElevatedButton(onPressed: () {}, child: const Text("Search Waste")),

            const SizedBox(height: 12),

            ElevatedButton(onPressed: () {}, child: const Text("About App")),
          ],
        ),
      ),
    );
  }
}
