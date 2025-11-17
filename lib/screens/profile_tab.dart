import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../services/firestore_service.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});
  final AuthService _auth = AuthService();
  final FirestoreService _fs = FirestoreService();

  Future<void> _signOut(BuildContext context) async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100, color: Colors.teal),
            const SizedBox(height: 12),
            Text(user?.email ?? 'No email', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('UID: ${user?.uid ?? '—'}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            ElevatedButton.icon(onPressed: () => _signOut(context), icon: const Icon(Icons.logout), label: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
