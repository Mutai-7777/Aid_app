// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../services/in_memory_store.dart';
// import '../../widgets/donation_card.dart';
// import 'post_donation_screen.dart';

// class DonationsTab extends StatelessWidget {
//   const DonationsTab({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final store = Provider.of<InMemoryStore>(context);

//     return Scaffold(
//       body: ListView.builder(
//         itemCount: store.donations.length,
//         itemBuilder: (context, index) =>
//             DonationCard(donation: store.donations[index]),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.teal,
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const PostDonationScreen()),
//         ),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// lib/screens/donations/donations_tab.dart (stateful)
import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class DonationsTab extends StatefulWidget {
  const DonationsTab({super.key});
  @override
  State<DonationsTab> createState() => _DonationsTabState();
}

class _DonationsTabState extends State<DonationsTab> {
  List<dynamic> donations = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    try {
      final data = await ApiService.fetchDonations();
      setState(() {
        donations = data;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());
    return RefreshIndicator(
      onRefresh: load,
      child: ListView.builder(
        itemCount: donations.length,
        itemBuilder: (context, i) {
          final d = donations[i];
          return ListTile(
            title: Text(d['title']),
            subtitle: Text(d['description'] ?? ''),
            trailing: TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                await ApiService.deleteDonation(d['id']);
                await load();
              },
            ),
          );
        },
      ),
    );
  }
}
