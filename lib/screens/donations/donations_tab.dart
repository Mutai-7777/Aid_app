import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../widgets/donation_card.dart';
import 'post_donation_screen.dart';

class DonationsTab extends StatelessWidget {
   DonationsTab({super.key});
  final FirestoreService _fs =  FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _fs.donationsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Center(child: Text('Error loading donations'));
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final docs = snapshot.data!.docs;
          if (docs.isEmpty) return const Center(child: Text('No donations yet'));
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final d = docs[i];
              final data = d.data() as Map<String, dynamic>;
              return DonationCard(
                id: d.id,
                title: data['title'] ?? '',
                description: data['description'] ?? '',
                location: data['location'] ?? '',
                category: data['category'] ?? '',
                postedBy: data['posted_by'] ?? data['postedBy'] ?? 'Unknown',
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostDonationScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
