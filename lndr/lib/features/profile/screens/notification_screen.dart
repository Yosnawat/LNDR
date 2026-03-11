import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // ตัวแปรเก็บสถานะเปิด/ปิด ของแต่ละสวิตช์
  bool appUpdates = true;
  bool promotions = false;
  bool newLogin = true;
  bool passwordChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        title: const Text('Notification', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('System Notifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          
          _buildSwitchTile(
            title: 'App Updates',
            subtitle: 'Receive notifications about app updates',
            value: appUpdates,
            onChanged: (val) => setState(() => appUpdates = val),
          ),
          _buildSwitchTile(
            title: 'Promotions',
            subtitle: 'Receive notifications about promotions',
            value: promotions,
            onChanged: (val) => setState(() => promotions = val),
          ),
          
          const SizedBox(height: 24),
          const Text('Account Notifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          
          _buildSwitchTile(
            title: 'New Login',
            subtitle: 'Receive notifications about new logins',
            value: newLogin,
            onChanged: (val) => setState(() => newLogin = val),
          ),
          _buildSwitchTile(
            title: 'Password Change',
            subtitle: 'Receive notifications about password changes',
            value: passwordChange,
            onChanged: (val) => setState(() => passwordChange = val),
          ),
        ],
      ),
    );
  }

  // Widget สำหรับสร้างกล่องสวิตช์
  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: SwitchListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.white,
        activeTrackColor: const Color(0xFF333333), // สีดำของแอป LNDR
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade300,
      ),
    );
  }
}