import 'package:flutter/material.dart';
import '../screens/donations/donations_tab.dart';
import '../screens/jobs/jobs_tab.dart';
import '../screens/loans/loans_tab.dart';
import '../screens/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  static final List<Widget> _pages = [
    DonationsTab(),
    JobsTab(),
    LoansTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AidConnect'),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: 'Donations'),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on_outlined), label: 'Loans'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
