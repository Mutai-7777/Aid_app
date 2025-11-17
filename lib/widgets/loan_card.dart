import 'package:flutter/material.dart';

class LoanCard extends StatelessWidget {
  final String id;
  final String requesterName;
  final double amount;
  final String purpose;
  final double repaid;

  const LoanCard({super.key, required this.id, required this.requesterName, required this.amount, required this.purpose, required this.repaid});

  @override
  Widget build(BuildContext context) {
    final progress = (repaid / (amount == 0 ? 1 : amount)).clamp(0.0, 1.0);
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.primary, child: const Icon(Icons.monetization_on, color: Colors.white)),
        title: Text(requesterName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('KSh ${amount.toStringAsFixed(0)} — $purpose'),
          const SizedBox(height: 6),
          LinearProgressIndicator(value: progress),
          const SizedBox(height: 4),
          Text('Repaid: KSh ${repaid.toStringAsFixed(0)}'),
        ]),
        isThreeLine: true,
      ),
    );
  }
}
