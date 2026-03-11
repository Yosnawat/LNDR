import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async'; // <--- เพิ่มตัวนี้เพื่อให้จับเวลาได้

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  bool receiveNotifications = true;

  // --- ตัวแปรสำหรับจับเวลา ---
  // 💡 ทริค: ถ้าอยากทดสอบว่าหน้าเด้งจริงไหม ให้ลองเปลี่ยนจาก 30 * 60 เป็น 5 (วินาที) ดูชั่วคราวนะครับ
  int _timeLeft = 30 * 60; // 30 นาที 
  bool _isRunning = false; // สถานะเครื่องกำลังซัก
  Timer? _timer;

  // เริ่มนับเวลา
  void _startWash() {
    if (_isRunning) return;
    setState(() {
      _isRunning = true;
    });
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          // 🛑 เมื่อเวลาหมดถึง 00:00 ให้ทำสิ่งนี้ 🛑
          _timer?.cancel();
          _isRunning = false;
          
          // สั่งให้เด้งไปหน้าเสร็จซักผ้า (ใช้ pushReplacement เพื่อแทนที่หน้าเดิม จะได้กดย้อนกลับมาจับเวลาใหม่ไม่ได้)
          context.pushReplacement('/laundry-complete'); 
        }
      });
    });
  }

  // ยกเลิกการซัก
  void _cancelWash() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _timeLeft = 30 * 60; // รีเซ็ตเวลากลับเป็น 30 นาที
    });
  }

  // แปลงเวลาให้เป็น Format สวยๆ (เช่น 29:59)
  String get timerString {
    int minutes = _timeLeft ~/ 60;
    int seconds = _timeLeft % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // คำนวณหลอดวงกลม (0.0 ถึง 1.0)
  double get progressValue {
    return 1.0 - (_timeLeft / (30 * 60));
  }

  @override
  void dispose() {
    _timer?.cancel(); // ป้องกัน Error ตอนกดย้อนกลับ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => context.pop(), // กดกลับหน้าเดิม
        ),
        title: const Text('LNDR', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
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
                    value: _isRunning ? progressValue : 0.0, // ให้หลอดวิ่งเวลาซัก
                    strokeWidth: 12,
                    backgroundColor: Colors.grey.shade200,
                    color: _isRunning ? Colors.black87 : Colors.grey.shade400, // เปลี่ยนสีตอนเริ่มซัก
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(timerString, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    const Text('Cycle duration', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                // ปุ่ม Start Wash
                Expanded(
                  child: ElevatedButton(
                    // ล็อกปุ่มไว้ถ้ากดซักไปแล้ว
                    onPressed: _isRunning ? null : _startWash,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isRunning ? Colors.grey : const Color(0xFF333333),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      _isRunning ? 'Washing...' : 'Start Wash', 
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // ปุ่ม Cancel
                Expanded(
                  child: OutlinedButton(
                    // ถ้ากำลังซักอยู่ ให้กดยกเลิกการซัก แต่ถ้ายังไม่เริ่มซัก ให้กดกลับหน้าเดิมได้
                    onPressed: _isRunning ? _cancelWash : () => context.pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: _isRunning ? const Color(0xFF333333) : Colors.grey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
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
                value: receiveNotifications,
                onChanged: (bool value) {
                  setState(() {
                    receiveNotifications = value; // สวิตช์เปิด-ปิดได้จริง
                  });
                },
                activeColor: Colors.black87,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.push('/report'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF333333),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Report Issue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}