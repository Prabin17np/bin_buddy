import 'package:bin_buddy/features/dashboard/presentation/pages/bottom_pages/overview_page.dart';
import 'package:bin_buddy/features/dashboard/presentation/pages/bottom_pages/home_bottom_page.dart';
import 'package:bin_buddy/features/dashboard/presentation/pages/bottom_pages/scan_bottom_page.dart';
import 'package:bin_buddy/features/dashboard/presentation/pages/bottom_pages/search_bottom_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const HomeBottomScreen(),
    const ScanBottomScreen(),
    const SearchBottomScreen(),
    const AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.scanner), label: "Scan"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Overview"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: lstBottomScreen[_selectedIndex],
    );
  }
}
