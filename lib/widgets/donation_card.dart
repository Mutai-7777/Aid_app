import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String location;
  final String category;
  final String postedBy;

  const DonationCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.category,
    required this.postedBy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.primary, child: const Icon(Icons.volunteer_activism, color: Colors.white)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$description\n📍 $location • $category\nPosted by: $postedBy'),
        isThreeLine: true,
      ),
    );
  }
}
