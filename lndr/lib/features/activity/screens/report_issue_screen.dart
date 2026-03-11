import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportIssueScreen extends StatelessWidget {
  const ReportIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Report Issue'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Name', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          const TextField(decoration: InputDecoration(hintText: 'Yosnawat')),
          const SizedBox(height: 16),
          const Text('University ID', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          const TextField(decoration: InputDecoration(hintText: '6731503029')),
          const SizedBox(height: 24),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              title: const Text('Machine Not Starting'),
              value: true,
              onChanged: (val) {},
              activeThumbColor: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildActionTile('Help Center', Icons.power_settings_new),
          const SizedBox(height: 16),
          _buildActionTile('Help Center', Icons.help_outline),
          const SizedBox(height: 16),
          _buildActionTile('Log Out', Icons.timer_outlined, onTap: () => context.go('/login')),
          
          const SizedBox(height: 32),
          const Text('University Residence Hall C', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildActionTile(String title, IconData icon, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title),
      trailing: Icon(icon, color: Colors.grey),
      tileColor: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
    );
  }
}