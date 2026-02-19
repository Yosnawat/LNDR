import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ใช้ SingleChildScrollView เพื่อป้องกันปัญหาแป้นพิมพ์บังหน้าจอ
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch, // ขยายเต็มความกว้าง
              children: [
                // ส่วนโลโก้และหัวข้อ
                const Icon(Icons.local_laundry_service_outlined, size: 80, color: Color(0xFF333333)),
                const SizedBox(height: 24),
                const Text(
                  'LNDR',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                ),
                const Text(
                  'Laundry Made Easy',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 48),

                // ช่องกรอก Email
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'enter your email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 16),

                // ช่องกรอก Password
                const TextField(
                  obscureText: true, // ซ่อนรหัสผ่าน
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'enter your password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 32),

                // ปุ่ม Login
                ElevatedButton(
                  onPressed: () => context.go('/home'),
                  child: const Text('Log In'),
                ),
                
                const SizedBox(height: 16),
                // ปุ่มแบบ Text สำหรับ Sign Up (ตาม Mockup)
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Don\'t have an account? Sign Up', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}