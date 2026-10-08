import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final drinks = [
      {'name': 'Pure Mineral Water', 'pct': '100% Hydration Factor', 'icon': Icons.water_drop, 'color': Colors.blue},
      {'name': 'Green Tea / Matcha', 'pct': '95% Hydration Factor', 'icon': Icons.emoji_food_beverage, 'color': Colors.green},
      {'name': 'Electrolyte Sports Drink', 'pct': '100% Hydration Factor', 'icon': Icons.bolt, 'color': Colors.amber},
      {'name': 'Fresh Fruit Juice', 'pct': '85% Hydration Factor', 'icon': Icons.blender, 'color': Colors.orange},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Beverage Library'), actions: [IconButton(icon: const Icon(Icons.add, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final d in drinks) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(backgroundColor: (d['color'] as Color).withValues(alpha: 0.2), child: Icon(d['icon'] as IconData, color: d['color'] as Color)),
                title: Text(d['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: Text(d['pct'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                trailing: const Icon(Icons.chevron_right, color: AppTheme.primary),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
