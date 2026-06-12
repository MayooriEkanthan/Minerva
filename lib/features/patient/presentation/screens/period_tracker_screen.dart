import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../widgets/custom_calendar_grid.dart';
import '../widgets/symptom_chip.dart';

class PeriodTrackerScreen extends StatefulWidget {
  const PeriodTrackerScreen({super.key});

  @override
  State<PeriodTrackerScreen> createState() => _PeriodTrackerScreenState();
}

class _PeriodTrackerScreenState extends State<PeriodTrackerScreen> {
  bool _periodStartReminder = true;
  bool _contraceptionReminder = false;
  bool _medicationReminder = true;
  bool _syncWearable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppTheme.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MinervaLogo(size: 32, showText: false),
            SizedBox(width: 8),
            Text(
              'Minerva',
              style: TextStyle(color: AppTheme.textSecondary, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Section
            Text(
              'Period Tracker',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            const CustomCalendarGrid(),
            const SizedBox(height: 16),
            
            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem(AppTheme.primaryColor, 'Period', isOutline: false),
                _buildLegendItem(Colors.lightBlueAccent, 'Fertile', isOutline: false),
                _buildLegendItem(AppTheme.primaryColor, 'Next Period', isOutline: true),
              ],
            ),
            const SizedBox(height: 24),
            
            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Next Period:', style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.6))),
                const Text('5 days', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Average Cycle Length:', style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.6))),
                const Text('28 days', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 32),
            
            // Log Symptoms Section
            Text(
              'Log Symptoms',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SymptomChip(label: 'Cramps', icon: Icons.adjust, color: AppTheme.primaryColor, onTap: () {}),
                SymptomChip(label: 'Mood Swings', icon: Icons.cloud_outlined, color: Colors.lightBlueAccent, onTap: () {}),
                SymptomChip(label: 'Heavy Flow', icon: Icons.water_drop_outlined, color: Colors.orangeAccent, onTap: () {}),
                SymptomChip(label: 'Fever', icon: Icons.thermostat_outlined, color: Colors.purpleAccent, onTap: () {}),
                SymptomChip(label: 'Spotting', icon: Icons.blur_on, color: Colors.greenAccent, onTap: () {}),
              ],
            ),
            const SizedBox(height: 32),
            
            // Reminders Section
            Text(
              'Reminders',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            _buildSwitchRow('Period Start', _periodStartReminder, (val) => setState(() => _periodStartReminder = val)),
            _buildSwitchRow('Contraception', _contraceptionReminder, (val) => setState(() => _contraceptionReminder = val)),
            _buildSwitchRow('Medication', _medicationReminder, (val) => setState(() => _medicationReminder = val)),
            const SizedBox(height: 32),
            
            // Info Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.lock_outline, color: AppTheme.textSecondary),
                      const SizedBox(width: 12),
                      Text(
                        'Your data is private and secure.',
                        style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.7)),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  Row(
                    children: [
                      const Icon(Icons.watch_outlined, color: AppTheme.primaryColor),
                      const SizedBox(width: 12),
                      Text(
                        'Sync with wearable data',
                        style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.7)),
                      ),
                      const Spacer(),
                      Switch(
                        value: _syncWearable,
                        onChanged: (val) => setState(() => _syncWearable = val),
                        activeColor: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label, {required bool isOutline}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: isOutline ? Colors.transparent : color,
            shape: BoxShape.circle,
            border: isOutline ? Border.all(color: color, width: 2) : null,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.6), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildSwitchRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.6))),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}
