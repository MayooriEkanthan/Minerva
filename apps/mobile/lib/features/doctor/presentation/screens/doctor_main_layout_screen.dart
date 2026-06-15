import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'doctor_home_screen.dart';
import 'doctor_patients_screen.dart';
import 'doctor_consult_screen.dart';
import 'doctor_feedback_screen.dart';
import 'doctor_settings_screen.dart';

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
    const DoctorSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textSecondary,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            activeIcon: Icon(Icons.group),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Consult',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            activeIcon: Icon(Icons.star),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
