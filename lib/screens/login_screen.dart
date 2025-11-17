import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _loginEmail() async {
    setState(() { _loading = true; _error = null; });
    try {
      await _auth.signInWithEmail(_email.text.trim(), _password.text.trim());
    } catch (e) {
      setState(() => _error = e.toString());
    } finally { setState(() => _loading = false); }
  }

  Future<void> _loginGoogle() async {
    setState(() => _loading = true);
    try {
      await _auth.signInWithGoogle();
    } catch (e) {
      setState(() => _error = e.toString());
    } finally { setState(() => _loading = false); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('AidConnect', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  TextField(controller: _email, decoration: const InputDecoration(labelText: 'Email')),
                  const SizedBox(height: 8),
                  TextField(controller: _password, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
                  if (_error != null) Padding(padding: const EdgeInsets.only(top:8), child: Text(_error!, style: const TextStyle(color: Colors.red))),
                  const SizedBox(height: 14),
                  ElevatedButton(onPressed: _loading ? null : _loginEmail, child: _loading ? const SizedBox(width:20,height:20,child:CircularProgressIndicator(color:Colors.white,strokeWidth:2)) : const Text('Login')),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: Image.network('https://images.unsplash.com/photo-1678483790053-71367bc7a02c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z29vZ2xlJTIwbG9nb3xlbnwwfHwwfHx8MA%3D%3D', width:20, height:20), // optionally include asset
                    label: const Text('Sign in with Google'),
                    onPressed: _loading ? null : _loginGoogle,
                  ),
                  const SizedBox(height: 8),
                  TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())), child: const Text('Create account')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
