import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LNDR'),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'), 
            icon: const Icon(Icons.settings_outlined)
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // เครื่องที่ 1: เปลี่ยนกลับมาให้กดใช้งานได้ปกติ
          GestureDetector(
            onTap: () => context.push('/timer'), // <--- ปล่อยให้กดไปหน้า Timer ได้แล้ว
            child: const MachineCard(
              title: 'Machine 1', 
              statusText: 'Available', 
              subText: 'Est. wait time: 0 mins', 
              status: MachineStatus.available,
            ),
          ),
          const SizedBox(height: 12),
          
          // เครื่องที่ 2: กดเข้าไปหน้า timer ปกติ
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
          
          // เครื่องที่ 3: กดเข้าไปหน้า timer ปกติ
          GestureDetector(
            onTap: () => context.push('/timer'), 
            child: const MachineCard(
              title: 'Machine 3', 
              statusText: 'Time remaining: 25 mins', 
              status: MachineStatus.inUseWithProgress, 
              progressValue: 0.6,
            ),
          ),
          const SizedBox(height: 12),
          
          // เครื่องที่ 4: เครื่องเสีย กดแล้วให้ไปหน้าแจ้งซ่อม
          GestureDetector(
            onTap: () => context.push('/report'), 
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
    // กำหนดสีตามสถานะ
    Color statusColor = status == MachineStatus.available 
        ? const Color(0xFF4CAF50) 
        : (status == MachineStatus.broken ? const Color(0xFFE53935) : const Color(0xFF2196F3));
    
    // กำหนดไอคอน (ถ้าเป็น Available ให้เป็น null คือไม่มีไอคอน)
    IconData? rightIcon = status == MachineStatus.available 
        ? null // <--- เอาแม่กุญแจออกแล้ว
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
              // จะโชว์ไอคอนก็ต่อเมื่อ rightIcon ไม่เป็นค่าว่าง
              if (rightIcon != null) Icon(rightIcon, color: Colors.grey.shade400),
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