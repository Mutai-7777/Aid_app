import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Use your local dev URL or deployed URL
  // If running backend locally and testing on mobile device/emulator, make sure to use the correct host.
  static const String baseUrl = 'http://localhost:4000/api'; // Android emulator
  // static const String baseUrl = 'http://localhost:4000/api'; // web or when running locally on host
  // static const String baseUrl = 'https://your-deployed-api.com/api';

  // --- Donations
  static Future<List<dynamic>> fetchDonations() async {
    final res = await http.get(Uri.parse('$baseUrl/donations'));
    if (res.statusCode == 200) return jsonDecode(res.body) as List<dynamic>;
    throw Exception('Failed to load donations');
  }

  static Future<dynamic> createDonation(Map<String, dynamic> data) async {
    final res = await http.post(
      Uri.parse('$baseUrl/donations'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (res.statusCode == 201 || res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to create donation');
  }

  static Future<dynamic> updateDonation(int id, Map<String, dynamic> data) async {
    final res = await http.put(
      Uri.parse('$baseUrl/donations/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to update donation');
  }

  static Future<void> deleteDonation(int id) async {
    final res = await http.delete(Uri.parse('$baseUrl/donations/$id'));
    if (res.statusCode == 200) return;
    throw Exception('Failed to delete donation');
  }

  // --- Jobs (similar)
  static Future<List<dynamic>> fetchJobs() async {
    final res = await http.get(Uri.parse('$baseUrl/jobs'));
    if (res.statusCode == 200) return jsonDecode(res.body) as List<dynamic>;
    throw Exception('Failed to load jobs');
  }

  static Future<dynamic> createJob(Map<String, dynamic> data) async {
    final res = await http.post(Uri.parse('$baseUrl/jobs'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    if (res.statusCode == 201 || res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to create job');
  }

  static Future<dynamic> updateJob(int id, Map<String, dynamic> data) async {
    final res = await http.put(Uri.parse('$baseUrl/jobs/$id'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to update job');
  }

  static Future<void> deleteJob(int id) async {
    final res = await http.delete(Uri.parse('$baseUrl/jobs/$id'));
    if (res.statusCode == 200) return;
    throw Exception('Failed to delete job');
  }

  // --- Loans
  static Future<List<dynamic>> fetchLoans() async {
    final res = await http.get(Uri.parse('$baseUrl/loans'));
    if (res.statusCode == 200) return jsonDecode(res.body) as List<dynamic>;
    throw Exception('Failed to load loans');
  }

  static Future<dynamic> createLoan(Map<String, dynamic> data) async {
    final res = await http.post(Uri.parse('$baseUrl/loans'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    if (res.statusCode == 201 || res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to create loan');
  }

  static Future<dynamic> updateLoan(int id, Map<String, dynamic> data) async {
    final res = await http.put(Uri.parse('$baseUrl/loans/$id'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to update loan');
  }

  static Future<void> deleteLoan(int id) async {
    final res = await http.delete(Uri.parse('$baseUrl/loans/$id'));
    if (res.statusCode == 200) return;
    throw Exception('Failed to delete loan');
  }
}
