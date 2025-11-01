import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/in_memory_store.dart';
import '../../widgets/donation_card.dart';
import 'post_donation_screen.dart';

class DonationsTab extends StatelessWidget {
  const DonationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InMemoryStore>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: store.donations.length,
        itemBuilder: (context, index) =>
            DonationCard(donation: store.donations[index]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PostDonationScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
