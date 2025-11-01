import 'package:flutter/material.dart';
import '../models/loan_model.dart';

class LoanCard extends StatelessWidget {
  final MicroLoan loan;
  const LoanCard({super.key, required this.loan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: ListTile(
        title: Text(loan.requesterName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
            "💰 Amount: KSh ${loan.amount}\n🎯 Purpose: ${loan.purpose}\n✅ Repaid: KSh ${loan.repaid}"),
        trailing: const Icon(Icons.attach_money, color: Colors.teal),
      ),
    );
  }
}
