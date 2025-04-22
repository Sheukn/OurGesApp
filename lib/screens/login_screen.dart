import 'package:flutter/material.dart';
import 'package:ourgesapp/screens/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool saveCredentials = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              'assets/logo.png',
              height: 100,
            ),

            Text(
              'Connexion',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 24),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: handleLogin,
                child: const Text('Se connecter'),
              ),
            ),

            CheckboxListTile(
              title: const Text('Se souvenir de moi'),
              value: saveCredentials,
              onChanged: (bool? value) {
                setState(() {
                  saveCredentials = value!;
                });
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void handleLogin() {
    // final email = emailController.text;
    // final password = passwordController.text;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen()
        ),
      );
  }
}
