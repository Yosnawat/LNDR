import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(), // กดกลับหน้าเดิม
        ),
        title: const Text('LNDR'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // วงกลมจับเวลา
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 0.0, // ยังไม่เริ่ม
                    strokeWidth: 12,
                    backgroundColor: Colors.grey.shade200,
                    color: Colors.black87,
                  ),
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('30:00', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    Text('Cycle duration', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Start Wash'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: const Text('Cancel', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // สวิตช์เปิดปิดการแจ้งเตือน
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                title: const Text('Receive Notifications', style: TextStyle(fontWeight: FontWeight.w500)),
                value: true,
                onChanged: (bool value) {},
                activeThumbColor: Colors.black87,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.push('/report'),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF333333)),
                child: const Text('Report Issue'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}