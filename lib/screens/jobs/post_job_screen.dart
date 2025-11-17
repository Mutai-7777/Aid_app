import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../services/auth_service.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});
  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _loc = TextEditingController();
  final _wage = TextEditingController();
  final _fs = FirestoreService();
  final _auth = AuthService();
  bool _saving = false;

  Future<void> _submit() async {
    setState(() => _saving = true);
    final user = _auth.currentUser;
    await _fs.createJob({
      'title': _title.text.trim(),
      'description': _desc.text.trim(),
      'location': _loc.text.trim(),
      'wage': _wage.text.trim(),
      'posted_by': user?.email ?? user?.uid,
      'user_id': user?.uid,
    });
    setState(() => _saving = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Job')),
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
            TextField(controller: _wage, decoration: const InputDecoration(labelText: 'Wage')),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _saving ? null : _submit, child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
