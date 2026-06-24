import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../../../patient/presentation/widgets/custom_calendar_grid.dart';
import '../../../patient/presentation/widgets/symptom_chip.dart';

class PatientPeriodTrackerViewScreen extends StatelessWidget {
  const PatientPeriodTrackerViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MinervaLogo(size: 32, showText: false),
            SizedBox(width: 8),
            Text(
              'Minerva',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Section
            Text(
              'Patient Period Tracker',
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
                Text('Next Period:', style: TextStyle(color: AppTheme.textSecondary)),
                const Text('5 days', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Average Cycle Length:', style: TextStyle(color: AppTheme.textSecondary)),
                const Text('28 days', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 32),
            
            // Logged Symptoms Section
            Text(
              'Reported Symptoms',
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
                        'Patient data is confidential and secure.',
                        style: TextStyle(color: AppTheme.textSecondary),
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
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
        ),
      ],
    );
  }
}
