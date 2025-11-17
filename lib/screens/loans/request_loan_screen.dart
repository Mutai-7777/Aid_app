import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../services/auth_service.dart';

class RequestLoanScreen extends StatefulWidget {
  const RequestLoanScreen({super.key});
  @override
  State<RequestLoanScreen> createState() => _RequestLoanScreenState();
}

class _RequestLoanScreenState extends State<RequestLoanScreen> {
  final _name = TextEditingController();
  final _amount = TextEditingController();
  final _purpose = TextEditingController();
  final _fs = FirestoreService();
  final _auth = AuthService();
  bool _saving = false;

  Future<void> _submit() async {
    setState(() => _saving = true);
    final user = _auth.currentUser;
    await _fs.createLoan({
      'requester_name': _name.text.trim(),
      'amount': double.tryParse(_amount.text.trim()) ?? 0,
      'purpose': _purpose.text.trim(),
      'repaid': 0,
      'posted_by': user?.email ?? user?.uid,
      'user_id': user?.uid,
    });
    setState(() => _saving = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request Loan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _name, decoration: const InputDecoration(labelText: 'Your name')),
            const SizedBox(height: 8),
            TextField(controller: _amount, decoration: const InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
            const SizedBox(height: 8),
            TextField(controller: _purpose, decoration: const InputDecoration(labelText: 'Purpose')),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _saving ? null : _submit, child: _saving ? const CircularProgressIndicator() : const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
