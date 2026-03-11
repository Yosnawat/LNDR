import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.remove), // เส้นขีดตาม design
          onPressed: () => context.pop(),
        ),
        title: const Text('Settings'),
        actions: [
          IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingTile('Machine 3', 'Lim Got', 'At dorm tee Bomnreg', true),
          const SizedBox(height: 12),
          _buildSettingTile('Machine 3', 'Aly Hication', 'Favorite Machines', false),
          const SizedBox(height: 12),
          _buildSettingTile('Machine 5', 'Flam Sabt', 'My vs. Nat Net Starting', true),
          const SizedBox(height: 24),
          const Text('Favorite', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          _buildSettingTile('Aly Hication', 'Favorite Machines', 'Fast tee bot (15 mins)', true),
          const SizedBox(height: 24),
          ListTile(
            title: const Text('Report Issue', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.person_outline),
            onTap: () => context.push('/report'),
            tileColor: Colors.grey.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile(String title, String subtitle1, String subtitle2, bool switchValue) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle1, style: const TextStyle(color: Colors.black87)),
            Text(subtitle2, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
          ],
        ),
        trailing: Switch(
          value: switchValue,
          onChanged: (val) {},
          activeThumbColor: Colors.black87,
        ),
      ),
    );
  }
}