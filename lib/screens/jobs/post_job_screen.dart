import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/in_memory_store.dart';
import '../../models/job_model.dart';
import 'package:uuid/uuid.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final wageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InMemoryStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Post Job"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: titleCtrl, decoration: const InputDecoration(labelText: "Title")),
              TextFormField(controller: descCtrl, decoration: const InputDecoration(labelText: "Description")),
              TextFormField(controller: locationCtrl, decoration: const InputDecoration(labelText: "Location")),
              TextFormField(controller: wageCtrl, decoration: const InputDecoration(labelText: "Wage")),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    store.postJob(JobPost(
                      id: const Uuid().v4(),
                      title: titleCtrl.text,
                      description: descCtrl.text,
                      location: locationCtrl.text,
                      wage: wageCtrl.text,
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
