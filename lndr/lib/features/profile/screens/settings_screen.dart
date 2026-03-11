import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
        title: const Text(
          'Profile & Settings',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // โชว์ข้อมูลชื่อ (ล็อกไม่ให้พิมพ์แก้)
          const Text(
            'Name',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'Yosnawat Onjan',
              hintStyle: const TextStyle(color: Colors.black87),
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // โชว์ข้อมูลรหัสนักศึกษา (ล็อกไม่ให้พิมพ์แก้)
          const Text(
            'University ID',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: '6731503029',
              hintStyle: const TextStyle(color: Colors.black87),
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // เมนูต่างๆ

          // 1. เพิ่มปุ่ม Notifications ตรงนี้
          _buildActionTile(
            'Notifications',
            Icons.notifications_none_outlined,
            onTap: () => context.push('/notifications'),
          ),
          const SizedBox(height: 12),

          // 2. ปุ่ม Help Center เดิม
          _buildActionTile(
            'Help Center',
            Icons.help_outline,
            onTap: () => context.push('/help'),
          ),
          const SizedBox(height: 12),

          // 3. ปุ่ม Log Out เดิม
          _buildActionTile(
            'Log Out',
            Icons.logout,
            isDestructive: true,
            onTap: () => context.go('/login'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    String title,
    IconData icon, {
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        icon,
        color: isDestructive ? Colors.red : Colors.grey.shade600,
      ),
      tileColor: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
    );
  }
}
