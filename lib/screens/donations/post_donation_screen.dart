import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/in_memory_store.dart';
import '../../models/donation_model.dart';
import 'package:uuid/uuid.dart';

class PostDonationScreen extends StatefulWidget {
  const PostDonationScreen({Key? key}) : super(key: key);

  @override
  State<PostDonationScreen> createState() => _PostDonationScreenState();
}

class _PostDonationScreenState extends State<PostDonationScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final categoryCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InMemoryStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Donation"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: "Title"),
                validator: (v) => v!.isEmpty ? "Enter title" : null,
              ),
              TextFormField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: "Description"),
                validator: (v) => v!.isEmpty ? "Enter description" : null,
              ),
              TextFormField(
                controller: locationCtrl,
                decoration: const InputDecoration(labelText: "Location"),
              ),
              TextFormField(
                controller: categoryCtrl,
                decoration: const InputDecoration(labelText: "Category"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    store.postDonation(Donation(
                      id: const Uuid().v4(),
                      title: titleCtrl.text,
                      description: descCtrl.text,
                      location: locationCtrl.text,
                      category: categoryCtrl.text,
                      postedBy: store.userName ?? "Anonymous",
                    ));
                    Navigator.pop(context);
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
