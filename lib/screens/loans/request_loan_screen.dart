import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/in_memory_store.dart';
import '../../models/loan_model.dart';
import 'package:uuid/uuid.dart';

class RequestLoanScreen extends StatefulWidget {
  const RequestLoanScreen({Key? key}) : super(key: key);

  @override
  State<RequestLoanScreen> createState() => _RequestLoanScreenState();
}

class _RequestLoanScreenState extends State<RequestLoanScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final purposeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InMemoryStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Loan"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Your Name")),
              TextFormField(
                controller: amountCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Amount"),
              ),
              TextFormField(controller: purposeCtrl, decoration: const InputDecoration(labelText: "Purpose")),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    store.requestLoan(MicroLoan(
                      id: const Uuid().v4(),
                      requesterName: nameCtrl.text,
                      amount: double.tryParse(amountCtrl.text) ?? 0,
                      purpose: purposeCtrl.text,
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
