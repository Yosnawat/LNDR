import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F), // สีพื้นหลัง Dark Mode ของ Google
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // โลโก้ Google
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                  children: [
                    TextSpan(text: 'G', style: TextStyle(color: Color(0xFF4285F4))), // ฟ้า
                    TextSpan(text: 'o', style: TextStyle(color: Color(0xFFEA4335))), // แดง
                    TextSpan(text: 'o', style: TextStyle(color: Color(0xFFFBBC05))), // เหลือง
                    TextSpan(text: 'g', style: TextStyle(color: Color(0xFF4285F4))), // ฟ้า
                    TextSpan(text: 'l', style: TextStyle(color: Color(0xFF34A853))), // เขียว
                    TextSpan(text: 'e', style: TextStyle(color: Color(0xFFEA4335))), // แดง
                  ],
                ),
              ),
              const SizedBox(height: 36),
              
              const Text('Choose an account', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w400)),
              const SizedBox(height: 8),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                  children: [
                    TextSpan(text: 'to continue to '),
                    TextSpan(text: 'LNDR', style: TextStyle(color: Color(0xFF8AB4F8), fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // บัญชีของคุณ Yosnawat (กดแล้วเข้าหน้า Home)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => context.go('/home'), // กดแล้วเข้าแอป
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF5F6368),
                          child: Text('Y', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18)),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('YOSNAWAT ONJAN', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                              const SizedBox(height: 2),
                              Text('6731503029@lamduan.mfu.ac.th', style: TextStyle(color: Colors.grey.shade400, fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Color(0xFF5F6368), thickness: 1),
              ),

              // ปุ่ม Use another account
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        const Icon(Icons.account_circle_outlined, color: Colors.white70, size: 28),
                        const SizedBox(width: 16),
                        const Text('Use another account', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // ข้อความ Terms of service
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.white54, fontSize: 12.5, height: 1.5),
                  children: [
                    TextSpan(text: 'Before using this app, you can review LNDR\'s '),
                    TextSpan(text: 'privacy policy', style: TextStyle(color: Color(0xFF8AB4F8), fontWeight: FontWeight.w500)),
                    TextSpan(text: ' and '),
                    TextSpan(text: 'terms of\nservice', style: TextStyle(color: Color(0xFF8AB4F8), fontWeight: FontWeight.w500)),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
              const Spacer(),

              // Footer ด้านล่างสุด
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('English (United States)   ▾', style: TextStyle(color: Colors.white54, fontSize: 12)),
                  Row(
                    children: const [
                      Text('Help', style: TextStyle(color: Colors.white54, fontSize: 12)),
                      SizedBox(width: 16),
                      Text('Privacy', style: TextStyle(color: Colors.white54, fontSize: 12)),
                      SizedBox(width: 16),
                      Text('Terms', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}