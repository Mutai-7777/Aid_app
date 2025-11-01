import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/in_memory_store.dart';
import 'donations/donations_tab.dart';
import 'jobs/jobs_tab.dart';
import 'loans/loans_tab.dart';
import 'profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    DonationsTab(),
    JobsTab(),
    LoansTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InMemoryStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AidConnect - Welcome, ${store.userName ?? "User"}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: 'Donations'),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Loans'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
