import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

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
        title: const Text('Help Center', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Frequently Asked Questions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          
          // รายการคำถาม-คำตอบ (FAQ)
          _buildFaqItem(
            'How do I report a broken machine?', 
            'You can go to the home screen and tap on a broken machine, or use the "Report Issue" button in the timer screen to notify our maintenance team.'
          ),
          _buildFaqItem(
            'How long does a standard wash cycle take?', 
            'A standard wash cycle takes exactly 30 minutes to complete.'
          ),
          _buildFaqItem(
            'Can I reserve a machine in advance?', 
            'Currently, machines are available on a first-come, first-served basis. You can check the wait time on the home screen.'
          ),
          _buildFaqItem(
            'Who do I contact for payment issues or refunds?', 
            'Please contact the University Residence Hall administration office directly for any payment disputes or refund requests.'
          ),
          
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          
          const Text('Need more help?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          
          // ปุ่มติดต่อเจ้าหน้าที่
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Opening email client...')));
              },
              icon: const Icon(Icons.support_agent, color: Color(0xFF333333)),
              label: const Text('Contact Support', style: TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Color(0xFF333333)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget สำหรับสร้างกล่องคำถามที่กดกางออกได้ (ExpansionTile)
  Widget _buildFaqItem(String question, String answer) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade50,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), 
        side: BorderSide(color: Colors.grey.shade200)
      ),
      child: ExpansionTile(
        title: Text(question, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black87)),
        iconColor: const Color(0xFF333333),
        collapsedIconColor: Colors.grey,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 0),
            child: Text(answer, style: const TextStyle(color: Colors.grey, height: 1.5)),
          ),
        ],
      ),
    );
  }
}