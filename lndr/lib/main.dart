import 'package:flutter/material.dart';
import 'config/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // กำหนดสีหลักตาม Design Mockup
  static const Color primaryColor = Color(0xFF333333); // สีเทาเข้ม
  static const Color backgroundColor = Color(0xFFF5F5F5); // สีพื้นหลังเทาอ่อน
  static const Color successColor = Color(0xFF4CAF50); // สีเขียว
  static const Color errorColor = Color(0xFFE53935); // สีแดง
  static const Color busyColor = Color(0xFF2196F3); // สีฟ้า

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LNDR App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          background: backgroundColor,
        ),
        useMaterial3: true,

        // --- แก้ไขตรงนี้ครับ (ใส่ titleTextStyle:) ---
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle( // <--- เติมบรรทัดนี้
            fontWeight: FontWeight.bold, 
            fontSize: 18, 
            color: primaryColor
          ),
        ),
        // ---------------------------------------

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primaryColor, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
      routerConfig: router,
    );
  }
}