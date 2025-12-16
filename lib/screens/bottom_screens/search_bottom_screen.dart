import 'package:flutter/material.dart';

class SearchBottomScreen extends StatelessWidget {
  const SearchBottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Search items...",
              prefixIcon: Icon(Icons.search),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.image),
                    title: Text("Result Item ${index + 1}"),
                    subtitle: const Text("Description goes here"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
