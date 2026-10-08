import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}
class _Tab1ScreenState extends State<Tab1Screen> {
  int _intake = 1850;
  final _goal = 2500;

  @override
  Widget build(BuildContext context) {
    final pct = (_intake / _goal).clamp(0.0, 1.0);
    return Scaffold(
      appBar: AppBar(title: const Text('HydroTrack • Water Intake'), actions: [IconButton(icon: const Icon(Icons.water_drop, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [AppTheme.card, AppTheme.surface]), borderRadius: BorderRadius.circular(24), border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3))),
            child: Column(children: [
              Stack(alignment: Alignment.center, children: [
                SizedBox(width: 160, height: 160, child: CircularProgressIndicator(value: pct, strokeWidth: 12, backgroundColor: Colors.white10, color: AppTheme.primary)),
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('$_intake', style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
                  const Text('ml', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 16)),
                ]),
              ]),
              const SizedBox(height: 16),
              Text('Goal: $_goal ml (${(pct * 100).toInt()}%)', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
              const SizedBox(height: 24),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() => _intake += 250),
                  icon: const Icon(Icons.add),
                  label: const Text('+250 ml Glass'),
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () => setState(() => _intake += 500),
                  icon: const Icon(Icons.local_drink),
                  label: const Text('+500 ml Bottle'),
                  style: OutlinedButton.styleFrom(foregroundColor: AppTheme.primary),
                ),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}
