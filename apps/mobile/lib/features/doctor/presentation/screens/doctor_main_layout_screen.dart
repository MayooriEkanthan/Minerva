import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'doctor_home_screen.dart';
import 'doctor_patients_screen.dart';
import 'doctor_consult_screen.dart';
import 'doctor_feedback_screen.dart';

class DoctorMainLayoutScreen extends StatefulWidget {
  const DoctorMainLayoutScreen({super.key});

  @override
  State<DoctorMainLayoutScreen> createState() => _DoctorMainLayoutScreenState();
}

class _DoctorMainLayoutScreenState extends State<DoctorMainLayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DoctorHomeScreen(),
    const DoctorPatientsScreen(),
    const DoctorConsultScreen(),
    const DoctorFeedbackScreen(),
    const Center(child: Text('Settings Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          _screens[_currentIndex],
          
          // Custom Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, Icons.favorite_border, 'Home'),
                  _buildNavItem(1, Icons.group_outlined, 'Patients'),
                  _buildNavItem(2, Icons.chat_bubble_outline, 'Consult'),
                  _buildNavItem(3, Icons.star_border, 'Feedback'),
                  _buildNavItem(4, Icons.settings_outlined, 'Settings'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? AppTheme.primaryColor : AppTheme.textSecondary.withOpacity(0.4);
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
