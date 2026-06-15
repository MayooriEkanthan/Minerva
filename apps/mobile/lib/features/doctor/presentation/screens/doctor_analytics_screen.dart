import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_segmented_control.dart';
import '../../../patient/presentation/widgets/mock_chart.dart';
import '../../../patient/presentation/widgets/metric_insight_section.dart';

class DoctorAnalyticsScreen extends StatefulWidget {
  const DoctorAnalyticsScreen({super.key});

  @override
  State<DoctorAnalyticsScreen> createState() => _DoctorAnalyticsScreenState();
}

class _DoctorAnalyticsScreenState extends State<DoctorAnalyticsScreen> {
  int _selectedCategoryIndex = 0;

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
        title: Text(
          'Analytics',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Category Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                _buildCategoryTab(0, 'Heart Rate', Icons.favorite_border, const Color(0xFF6B7BFF)),
                _buildCategoryTab(1, 'Mood', Icons.sentiment_satisfied_alt, AppTheme.primaryColor),
                _buildCategoryTab(2, 'Sleep', Icons.nightlight_round, Colors.orangeAccent),
                _buildCategoryTab(3, 'Activity', Icons.directions_run, Colors.deepOrangeAccent),
                _buildCategoryTab(4, 'Blood Pressure', Icons.bloodtype, Colors.redAccent),
              ],
            ),
          ),
          const Divider(height: 1, color: AppTheme.surfaceColor),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 80.0),
              child: _buildSelectedCategoryContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(int index, String label, IconData icon, Color color) {
    final isSelected = _selectedCategoryIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : AppTheme.textSecondary,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : AppTheme.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedCategoryContent() {
    switch (_selectedCategoryIndex) {
      case 0: return _buildHeartRateContent();
      case 1: return _buildMoodContent();
      case 2: return _buildSleepContent();
      case 3: return _buildActivityContent();
      case 4: return _buildBloodPressureContent();
      default: return const SizedBox();
    }
  }

  Widget _buildHeartRateContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Heart Rate', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Trend', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomSegmentedControl(
                options: const ['Day', 'Week', 'Month'],
                onChanged: (i) {},
                activeColor: const Color(0xFF6B7BFF),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const MockChart(
          normalizedData: [0.1, 0.9, 0.15, 0.1, 0.12, 0.2, 0.1], // Mock trend from image
          color: Color(0xFF6B7BFF),
          isBarChart: false,
        ),
        const SizedBox(height: 16),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF6B7BFF), shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text('Heart Rate (BPM)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 32),
        MetricInsightSection(
          insightText: 'Your average heart rate has been stable this week, with a notable peak on Tuesday (145 BPM) during an intense workout session. This indicates good cardiovascular response to exercise.',
          tips: [
            InsightTip(
              icon: Icons.trending_up,
              title: 'Stay Active',
              description: 'Aim for at least 30 minutes of moderate-intensity exercise most days of the week to strengthen your heart.',
            ),
            InsightTip(
              icon: Icons.favorite_border,
              title: 'Eat Heart-Healthy Foods',
              description: 'Incorporate fruits, vegetables, whole grains, and lean proteins into your diet. Limit saturated fats and sodium.',
            ),
            InsightTip(
              icon: Icons.nightlight_round,
              title: 'Prioritize Sleep',
              description: 'Ensure 7-9 hours of quality sleep per night. Good sleep is crucial for cardiovascular recovery and overall health.',
            ),
          ],
          summaryValue: '72 BPM',
          color: const Color(0xFF6B7BFF),
        ),
      ],
    );
  }

  Widget _buildMoodContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.sentiment_satisfied_alt, color: AppTheme.textSecondary),
                SizedBox(width: 8),
                Text('Mood', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomSegmentedControl(
                options: const ['Day', 'Week', 'Month'],
                onChanged: (i) {},
                activeColor: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const MockChart(
          normalizedData: [0.2, 0.4, 0.3, 0.6, 0.8, 0.8, 0.9], // Mock trend from image
          color: AppTheme.primaryColor,
          isBarChart: false,
        ),
        const SizedBox(height: 32),
        MetricInsightSection(
          insightText: 'Your mood has been stable with a slight positive uplift this week.',
          tips: [
            InsightTip(icon: Icons.check_circle_outline, description: 'Practice daily gratitude journaling.'),
            InsightTip(icon: Icons.check_circle_outline, description: 'Engage in a relaxing hobby for 15 mins.'),
            InsightTip(icon: Icons.check_circle_outline, description: 'Connect with a loved one regularly.'),
          ],
          summaryValue: 'Calm',
          color: AppTheme.primaryColor,
        ),
      ],
    );
  }

  Widget _buildSleepContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.nightlight_round, color: AppTheme.textSecondary),
                SizedBox(width: 8),
                Text('Sleep', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomSegmentedControl(
                options: const ['Day', 'Week', 'Month'],
                onChanged: (i) {},
                activeColor: Colors.orangeAccent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const MockChart(
          normalizedData: [0.6, 0.65, 0.55, 0.7, 0.7, 0.75, 0.7], // Mock bar data
          color: Colors.orangeAccent,
          isBarChart: true,
        ),
        const SizedBox(height: 32),
        MetricInsightSection(
          insightText: 'Average sleep duration increased by 0.5 hours this past week.',
          tips: [
            InsightTip(icon: Icons.check_circle_outline, description: 'Maintain a consistent sleep schedule.'),
            InsightTip(icon: Icons.check_circle_outline, description: 'Ensure your bedroom is dark and cool.'),
            InsightTip(icon: Icons.check_circle_outline, description: 'Avoid caffeine and heavy meals before bed.'),
          ],
          summaryValue: '7.8 hrs',
          color: Colors.orangeAccent,
        ),
      ],
    );
  }

  Widget _buildActivityContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.sentiment_neutral, color: AppTheme.textSecondary),
                SizedBox(width: 8),
                Text('Activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomSegmentedControl(
                options: const ['Day', 'Week', 'Month'],
                onChanged: (i) {},
                activeColor: Colors.deepOrangeAccent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const MockChart(
          normalizedData: [0.1, 0.4, 0.2, 0.6, 0.5, 0.8, 0.7], // Mock line data
          color: Colors.deepOrangeAccent,
          isBarChart: false,
        ),
        const SizedBox(height: 32),
        MetricInsightSection(
          insightText: 'Activity levels are consistently high, exceeding daily goals.',
          tips: [
            InsightTip(icon: Icons.check_circle_outline, description: 'Incorporate short stretching breaks daily.'),
            InsightTip(icon: Icons.check_circle_outline, description: 'Explore a new form of exercise next week.'),
            InsightTip(icon: Icons.check_circle_outline, description: 'Stay hydrated throughout your workouts.'),
          ],
          summaryValue: 'Active',
          color: Colors.deepOrangeAccent,
        ),
      ],
    );
  }

  Widget _buildBloodPressureContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Blood Pressure', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Trend', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomSegmentedControl(
                options: const ['Day', 'Week', 'Month'],
                onChanged: (i) {},
                activeColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const MockChart(
          normalizedData: [0.4, 0.42, 0.38, 0.41, 0.45, 0.40, 0.42], // Mock trend
          color: Colors.redAccent,
          isBarChart: false,
        ),
        const SizedBox(height: 16),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text('Blood Pressure (mmHg)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 32),
        MetricInsightSection(
          insightText: 'Your blood pressure is within the healthy range. Keep up the good work!',
          tips: [
            InsightTip(
              icon: Icons.local_drink,
              title: 'Stay Hydrated',
              description: 'Drinking enough water helps maintain healthy blood pressure levels.',
            ),
            InsightTip(
              icon: Icons.restaurant_menu,
              title: 'Balanced Diet',
              description: 'Continue eating a diet low in sodium and rich in potassium.',
            ),
          ],
          summaryValue: '118/78 mmHg',
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
