import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(Icons.local_laundry_service_outlined, size: 100, color: Color(0xFF222222)),
              const SizedBox(height: 24),
              const Text(
                'LNDR',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
              ),
              const SizedBox(height: 8),
              const Text(
                'Laundry Made Easy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () => context.go('/login'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.grey.shade300, width: 2),
                ),
                child: const Text('Get Started', style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Already have account? Log in', style: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}