import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String location;
  final String wage;
  final String postedBy;

  const JobCard({super.key, required this.id, required this.title, required this.description, required this.location, required this.wage, required this.postedBy});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.primary, child: const Icon(Icons.work, color: Colors.white)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$description\n📍 $location • $wage\nPosted by: $postedBy'),
        isThreeLine: true,
      ),
    );
  }
}
