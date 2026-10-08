import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final rem = ['09:00 AM • Morning Glass', '11:00 AM • Hydrate at Desk', '01:30 PM • Post Lunch', '04:00 PM • Afternoon Refresh', '06:30 PM • Evening Refill'];
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Reminders'), actions: [IconButton(icon: const Icon(Icons.alarm_add, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final r in rem) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(r, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const Icon(Icons.check_circle, color: AppTheme.primary, size: 20),
              ]),
            ),
          ],
        ],
      ),
    );
  }
}
