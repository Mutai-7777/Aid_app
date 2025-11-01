import 'package:flutter/material.dart';
import '../models/donation_model.dart';

class DonationCard extends StatelessWidget {
  final Donation donation;
  const DonationCard({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: ListTile(
        title: Text(donation.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${donation.description}\n📍 ${donation.location}"),
        trailing: const Icon(Icons.favorite_border, color: Colors.teal),
      ),
    );
  }
}
