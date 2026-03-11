import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // <--- ต้องเพิ่มตัวนี้เพื่อใช้ kIsWeb
import 'firebase_options.dart';
import 'config/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // แก้ปัญหาจอขาว: ถ้าเป็น Web ให้ข้ามไปก่อน หรือถ้าจะรันต้องมั่นใจว่า config web ใน firebase_options ถูกต้อง
  if (!kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    // สำหรับ Web: ถ้ายังไม่ได้เซต Firebase Web แบบสมบูรณ์ ให้ข้ามไปเพื่อให้ UI แสดงผลได้
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      print("Firebase Web initialization skipped or failed: $e");
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color primaryColor = Color(0xFF333333);
  static const Color backgroundColor = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    // ครอบด้วย Center และ ConstrainedBox เพื่อให้หน้าเว็บดูเป็นทรงมือถือ
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450), // บีบหน้าจอให้เหมือนมือถือ
        child: MaterialApp.router(
          title: 'LNDR App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: backgroundColor,
            colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor,
              primary: primaryColor,
              surface: backgroundColor,
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryColor,
              ),
            ),
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
                borderSide: BorderSide(color: Color(0xFFEEEEEE)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: primaryColor, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}