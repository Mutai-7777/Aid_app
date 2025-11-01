import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/in_memory_store.dart';
import '../../widgets/job_card.dart';
import 'post_job_screen.dart';

class JobsTab extends StatelessWidget {
  const JobsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InMemoryStore>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: store.jobs.length,
        itemBuilder: (context, index) => JobCard(job: store.jobs[index]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PostJobScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
