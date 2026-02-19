import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dorm A - Laundry Room'), // ปรับชื่อให้ดูสมจริง
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          // จำลองข้อมูลเครื่องต่างๆ ตาม Design Mockup
          MachineCard(
            id: '1',
            type: 'Washer',
            status: MachineStatus.available,
          ),
          SizedBox(height: 12),
          MachineCard(
            id: '2',
            type: 'Washer',
            status: MachineStatus.busy,
            timeLeft: '25 mins left',
          ),
          SizedBox(height: 12),
          MachineCard(
            id: '3',
            type: 'Dryer',
            status: MachineStatus.busy,
            timeLeft: '10 mins left',
            isDryer: true,
          ),
           SizedBox(height: 12),
          MachineCard(
            id: '4',
            type: 'Washer',
            status: MachineStatus.broken,
            reportTime: 'Reported: 10 mins ago',
          ),
        ],
      ),
    );
  }
}

// --- ส่วนเสริม: สร้าง Widget การ์ดเครื่องซักผ้าขึ้นมาใหม่ ---

// Enum สำหรับกำหนดสถานะ
enum MachineStatus { available, busy, broken }

class MachineCard extends StatelessWidget {
  final String id;
  final String type;
  final MachineStatus status;
  final String? timeLeft;
  final String? reportTime;
  final bool isDryer;

  const MachineCard({
    super.key,
    required this.id,
    required this.type,
    required this.status,
    this.timeLeft,
    this.reportTime,
    this.isDryer = false,
  });

  @override
  Widget build(BuildContext context) {
    // กำหนดสีและไอคอนตามสถานะ
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (status) {
      case MachineStatus.available:
        statusColor = const Color(0xFF4CAF50); // เขียว
        statusIcon = Icons.lock_open_outlined;
        statusText = 'Available';
        break;
      case MachineStatus.busy:
        statusColor = const Color(0xFF2196F3); // ฟ้า
        statusIcon = Icons.person_outline;
        statusText = 'In Use';
        break;
      case MachineStatus.broken:
        statusColor = const Color(0xFFE53935); // แดง
        statusIcon = Icons.build_outlined;
        statusText = 'Broken';
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // ขอบมนตาม Design
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ไอคอนเครื่องซัก/อบ
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isDryer ? Icons.local_laundry_service : Icons.water_drop_outlined,
              color: Colors.grey.shade700,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          // ข้อมูลตรงกลาง
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$type $id',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // แสดงเวลาที่เหลือ หรือเวลาที่แจ้งซ่อม ถ้ามี
                if (timeLeft != null) ...[
                   const SizedBox(height: 4),
                   Text(timeLeft!, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                   // (Optional) ใส่ Progress Bar เล็กๆ ตรงนี้ได้ในอนาคต
                ],
                 if (reportTime != null) ...[
                   const SizedBox(height: 4),
                   Text(reportTime!, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ],
              ],
            ),
          ),
          // ไอคอนสถานะด้านขวาสุด
          Icon(statusIcon, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}