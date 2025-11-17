import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../services/auth_service.dart';

class PostDonationScreen extends StatefulWidget {
  const PostDonationScreen({super.key});
  @override
  State<PostDonationScreen> createState() => _PostDonationScreenState();
}

class _PostDonationScreenState extends State<PostDonationScreen> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _loc = TextEditingController();
  String _category = 'Food';
  final _fs = FirestoreService();
  final _auth = AuthService();
  bool _saving = false;

  Future<void> _submit() async {
    setState(() => _saving = true);
    final user = _auth.currentUser;
    await _fs.createDonation({
      'title': _title.text.trim(),
      'description': _desc.text.trim(),
      'location': _loc.text.trim(),
      'category': _category,
      'posted_by': user?.email ?? user?.uid ?? 'anonymous',
      'user_id': user?.uid,
    });
    setState(() => _saving = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Donation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _title, decoration: const InputDecoration(labelText: 'Title')),
            const SizedBox(height: 8),
            TextField(controller: _desc, decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 8),
            TextField(controller: _loc, decoration: const InputDecoration(labelText: 'Location')),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _category,
              items: const [
                DropdownMenuItem(value: 'Food', child: Text('Food')),
                DropdownMenuItem(value: 'Clothes', child: Text('Clothes')),
                DropdownMenuItem(value: 'Shelter', child: Text('Shelter')),
                DropdownMenuItem(value: 'Other', child: Text('Other')),
              ],
              onChanged: (v) => setState(() => _category = v ?? 'Food'),
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _saving ? null : _submit, child: _saving ? const CircularProgressIndicator() : const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
