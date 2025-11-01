import 'package:flutter/foundation.dart';
import '../models/donation_model.dart';
import '../models/job_model.dart';
import '../models/loan_model.dart';

class InMemoryStore extends ChangeNotifier {
  String? userName;
  String? role;

  final List<Donation> donations = [];
  final List<JobPost> jobs = [];
  final List<MicroLoan> loans = [];

  InMemoryStore() {
    _seedDemoData();
    debugPrint('✅ Demo data loaded: donations=${donations.length}, jobs=${jobs.length}, loans=${loans.length}');
  }

  // --- Authentication ---
  void login(String name, String userRole) {
    userName = name;
    role = userRole;
    notifyListeners();
  }

  void logout() {
    userName = null;
    role = null;
    notifyListeners();
  }

  // --- CRUD Actions ---
  void postDonation(Donation donation) {
    donations.insert(0, donation);
    notifyListeners();
  }

  void postJob(JobPost job) {
    jobs.insert(0, job);
    notifyListeners();
  }

  void requestLoan(MicroLoan loan) {
    loans.insert(0, loan);
    notifyListeners();
  }

  // --- Demo data ---
  void _seedDemoData() {
    donations.addAll([
      Donation(
        id: 'd1',
        title: 'Food Basket for Family',
        description: 'Rice, beans, and oil for one week.',
        location: 'Nairobi',
        category: 'Food',
        postedBy: 'Charity Aid Org',
      ),
      Donation(
        id: 'd2',
        title: 'Children Clothes Pack',
        description: 'Jackets and shoes for 8 children.',
        location: 'Kisumu',
        category: 'Clothes',
        postedBy: 'Hope Center',
      ),
    ]);

    jobs.addAll([
      JobPost(
        id: 'j1',
        title: 'Farm Helper (1-day)',
        description: 'Assist with harvesting.',
        location: 'Machakos',
        wage: 'KSh 800/day',
      ),
      JobPost(
        id: 'j2',
        title: 'House Cleaning (Half-day)',
        description: 'House cleaning service required.',
        location: 'Nakuru',
        wage: 'KSh 500',
      ),
    ]);

    loans.addAll([
      MicroLoan(
        id: 'l1',
        requesterName: 'Mary Atieno',
        amount: 5000,
        purpose: 'Start fruit stall',
        repaid: 1000,
      ),
      MicroLoan(
        id: 'l2',
        requesterName: 'John Mwangi',
        amount: 8000,
        purpose: 'Motorbike repair',
        repaid: 4000,
      ),
    ]);
  }
}
