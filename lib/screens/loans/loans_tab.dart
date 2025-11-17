import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../widgets/loan_card.dart';
import 'request_loan_screen.dart';

class LoansTab extends StatelessWidget {
   LoansTab({super.key});
  final FirestoreService _fs =  FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _fs.loansStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Center(child: Text('Error loading loans'));
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final docs = snapshot.data!.docs;
          if (docs.isEmpty) return const Center(child: Text('No loan requests yet'));
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final d = docs[i];
              final data = d.data() as Map<String, dynamic>;
              return LoanCard(
                id: d.id,
                requesterName: data['requester_name'] ?? data['requesterName'] ?? '',
                amount: (data['amount'] ?? 0).toDouble(),
                purpose: data['purpose'] ?? '',
                repaid: (data['repaid'] ?? 0).toDouble(),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RequestLoanScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
