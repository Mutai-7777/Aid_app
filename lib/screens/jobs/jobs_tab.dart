import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../widgets/job_card.dart';
import 'post_job_screen.dart';

class JobsTab extends StatelessWidget {
   JobsTab({super.key});
  final FirestoreService _fs = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _fs.jobsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Center(child: Text('Error loading jobs'));
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final docs = snapshot.data!.docs;
          if (docs.isEmpty) return const Center(child: Text('No job posts yet'));
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final d = docs[i];
              final data = d.data() as Map<String, dynamic>;
              return JobCard(
                id: d.id,
                title: data['title'] ?? '',
                description: data['description'] ?? '',
                location: data['location'] ?? '',
                wage: data['wage'] ?? '',
                postedBy: data['posted_by'] ?? data['postedBy'] ?? 'Unknown',
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostJobScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
