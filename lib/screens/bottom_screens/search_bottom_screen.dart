import 'package:flutter/material.dart';

class SearchBottomScreen extends StatefulWidget {
  const SearchBottomScreen({super.key});

  @override
  State<SearchBottomScreen> createState() => _SearchBottomScreenState();
}

class _SearchBottomScreenState extends State<SearchBottomScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search Bar
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search items...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),

          const SizedBox(height: 20),

          // Placeholder for search results
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Placeholder items
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.image),
                    title: Text("Result Item ${index + 1}"),
                    subtitle: const Text("Description goes here"),
                    trailing: const Icon(Icons.arrow_forward_ios),
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
