import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // เพิ่ม import เพื่อใช้เปลี่ยนหน้า

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LNDR'),
        actions: [
          // กดที่ฟันเฟืองแล้วไปหน้า Settings
          IconButton(
            onPressed: () => context.push('/settings'), 
            icon: const Icon(Icons.settings_outlined)
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // เครื่องที่ 1: ใช้ GestureDetector ครอบเพื่อให้กดได้
          GestureDetector(
            onTap: () => context.push('/timer'), // กดแล้วเด้งไปหน้าจับเวลา
            child: const MachineCard(
              title: 'Machine 1', 
              statusText: 'Available', 
              subText: 'Est. wait time: 0 mins', 
              status: MachineStatus.available,
            ),
          ),
          const SizedBox(height: 12),
          
          // เครื่องที่ 2
          GestureDetector(
            onTap: () => context.push('/timer'),
            child: const MachineCard(
              title: 'Machine 2', 
              statusText: 'In Use', 
              subText: 'Time wait time: 25 mins', 
              status: MachineStatus.inUse,
            ),
          ),
          const SizedBox(height: 12),
          
          // เครื่องที่ 3 (มีหลอดโหลด Progress)
          GestureDetector(
            onTap: () => context.push('/timer'),
            child: const MachineCard(
              title: 'Machine 3', 
              statusText: 'Time remaining: 25 mins', 
              status: MachineStatus.inUseWithProgress, 
              progressValue: 0.6, // หลอดโหลด 60%
            ),
          ),
          const SizedBox(height: 12),
          
          // เครื่องที่ 4 (เสียบ่อย)
          GestureDetector(
            onTap: () => context.push('/report'), // เครื่องเสีย กดแล้วให้ไปหน้าแจ้งซ่อม
            child: const MachineCard(
              title: 'Broken', 
              statusText: 'Broken', 
              subText: 'Reported: 10 mins ago', 
              status: MachineStatus.broken,
            ),
          ),
        ],
      ),
    );
  }
}

// --- ส่วนเสริม: สร้าง Widget การ์ดเครื่องซักผ้าขึ้นมาใหม่ ---

// Enum สำหรับกำหนดสถานะ (อัปเดตใหม่ให้ตรงกับ Wireframe)
enum MachineStatus { available, inUse, inUseWithProgress, broken }

class MachineCard extends StatelessWidget {
  final String title;
  final String statusText;
  final String? subText;
  final MachineStatus status;
  final double? progressValue;

  const MachineCard({
    super.key, 
    required this.title, 
    required this.statusText, 
    required this.status, 
    this.subText, 
    this.progressValue
  });

  @override
  Widget build(BuildContext context) {
    // กำหนดสีและไอคอนตามสถานะ
    Color statusColor = status == MachineStatus.available 
        ? const Color(0xFF4CAF50) 
        : (status == MachineStatus.broken ? const Color(0xFFE53935) : const Color(0xFF2196F3));
    IconData rightIcon = status == MachineStatus.available 
        ? Icons.lock_open_outlined 
        : (status == MachineStatus.broken ? Icons.build_outlined : Icons.person_outline);
    Color mainStatusColor = (status == MachineStatus.inUseWithProgress) ? Colors.black87 : statusColor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(12), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), 
            blurRadius: 8, 
            offset: const Offset(0, 2)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(
                      statusText, 
                      style: TextStyle(
                        color: mainStatusColor, 
                        fontWeight: FontWeight.bold, 
                        fontSize: status == MachineStatus.inUseWithProgress ? 14 : 16
                      )
                    ),
                    if (subText != null) ...[
                      const SizedBox(height: 4), 
                      Text(subText!, style: TextStyle(color: Colors.grey.shade500, fontSize: 12))
                    ],
                  ],
                ),
              ),
              Icon(rightIcon, color: Colors.grey.shade400),
            ],
          ),
          // แสดงหลอด Progress ถ้ามีสถานะ inUseWithProgress
          if (status == MachineStatus.inUseWithProgress && progressValue != null) ...[
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progressValue, 
              backgroundColor: Colors.grey.shade200, 
              color: Colors.black87, 
              minHeight: 6, 
              borderRadius: BorderRadius.circular(4)
            ),
          ]
        ],
      ),
    );
  }
}