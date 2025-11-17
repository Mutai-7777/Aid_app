import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Collections
  CollectionReference get donationsRef => _db.collection('donations');
  CollectionReference get jobsRef => _db.collection('jobs');
  CollectionReference get loansRef => _db.collection('loans');
  CollectionReference get usersRef => _db.collection('users');

  // Donations
  Stream<QuerySnapshot> donationsStream() => donationsRef.orderBy('created_at', descending: true).snapshots();
  Future<DocumentReference> createDonation(Map<String, dynamic> data) => donationsRef.add({
        ...data,
        'created_at': FieldValue.serverTimestamp(),
      });
  Future<void> updateDonation(String id, Map<String, dynamic> data) => donationsRef.doc(id).update(data);
  Future<void> deleteDonation(String id) => donationsRef.doc(id).delete();

  // Jobs
  Stream<QuerySnapshot> jobsStream() => jobsRef.orderBy('created_at', descending: true).snapshots();
  Future<DocumentReference> createJob(Map<String, dynamic> data) => jobsRef.add({...data, 'created_at': FieldValue.serverTimestamp()});
  Future<void> updateJob(String id, Map<String, dynamic> data) => jobsRef.doc(id).update(data);
  Future<void> deleteJob(String id) => jobsRef.doc(id).delete();

  // Loans
  Stream<QuerySnapshot> loansStream() => loansRef.orderBy('created_at', descending: true).snapshots();
  Future<DocumentReference> createLoan(Map<String, dynamic> data) => loansRef.add({...data, 'created_at': FieldValue.serverTimestamp()});
  Future<void> updateLoan(String id, Map<String, dynamic> data) => loansRef.doc(id).update(data);
  Future<void> deleteLoan(String id) => loansRef.doc(id).delete();

  // Users
  Future<void> upsertUser(String uid, Map<String, dynamic> data) => usersRef.doc(uid).set({...data, 'updated_at': FieldValue.serverTimestamp()}, SetOptions(merge: true));
}
