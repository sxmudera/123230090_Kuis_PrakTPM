import 'package:flutter/material.dart';
import 'package:kuis/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Mohon masukkan username dan password."),
        ),
      );
      return;
    }

    if (username == 'ivan' && password == '90') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Username atau password salah."),
        ),
      );
    }
  }

  @override // dispose untuk hapus controller saat page ditutup, biar ga memory leak
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 251, 229),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 180),

            Image.asset('assets/img/upnLogo.png', width: 200),
            const SizedBox(height: 24),

            const Text(
              'Kantin UPN',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            const Text('Login terlebih dahulu!'),
            const SizedBox(height: 32),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(
                    Icons.person_outline,
                    color: Color.fromARGB(255, 0, 91, 6),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 0, 91, 6),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 4, right: 6),
                  child: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color.fromARGB(255, 0, 91, 6),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 91, 6),
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 180),
          ],
        ),
      ),
    );
  }
}
