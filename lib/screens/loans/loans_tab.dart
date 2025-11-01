import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/in_memory_store.dart';
import '../../widgets/loan_card.dart';
import 'request_loan_screen.dart';

class LoansTab extends StatelessWidget {
  const LoansTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InMemoryStore>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: store.loans.length,
        itemBuilder: (context, index) => LoanCard(loan: store.loans[index]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RequestLoanScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
