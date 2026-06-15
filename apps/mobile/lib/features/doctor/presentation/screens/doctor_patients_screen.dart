import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../widgets/doctor_profile_header.dart';

class DoctorPatientsScreen extends StatefulWidget {
  const DoctorPatientsScreen({super.key});

  @override
  State<DoctorPatientsScreen> createState() => _DoctorPatientsScreenState();
}

class _DoctorPatientsScreenState extends State<DoctorPatientsScreen> {
  int _selectedTabIndex = 0; // 0 = All, 1 = Appointments, 2 = Reminders

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        title: const Row(
          children: [
            MinervaLogo(size: 32, showText: false),
            SizedBox(width: 8),
            Text(
              'Patients',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.search, color: AppTheme.primaryColor),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: const DoctorProfileHeader(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
            
            // Stats Grid
            Row(
              children: [
                Expanded(child: _buildStatCard('12', 'Upcoming\nConsultations', Icons.calendar_month_outlined, AppTheme.primaryColor)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard('3', 'Pending\nAppointments', Icons.access_time, AppTheme.primaryColor)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildStatCard('145', 'Consultations\nCompleted', Icons.check_circle_outline, AppTheme.textSecondary)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard('4.8', 'Patient Feedback\nSummary', Icons.format_quote, AppTheme.textSecondary)),
              ],
            ),
            const SizedBox(height: 24),
            
            // Latest Patient Feedback
            _buildLatestFeedbackCard(),
            const SizedBox(height: 32),
            
            // Notifications Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.notifications_none, color: AppTheme.primaryColor),
                    SizedBox(width: 8),
                    Text(
                      'Recent Notifications',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textSecondary),
                    ),
                  ],
                ),
                Text(
                  'View All',
                  style: TextStyle(color: AppTheme.primaryColor.withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Custom Segmented Control
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _buildTab(0, 'All'),
                  _buildTab(1, 'Appointments'),
                  _buildTab(2, 'Reminders'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Notifications List
            _buildNotificationList(),
            
            const SizedBox(height: 120), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int index, String title) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppTheme.textSecondary.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String title, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withOpacity(0.8)),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              'View Details',
              style: TextStyle(fontSize: 10, color: AppTheme.textSecondary, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestFeedbackCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest Patient\nFeedback',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textSecondary),
              ),
              Text(
                'View All Reviews',
                style: TextStyle(fontSize: 10, color: AppTheme.primaryColor.withOpacity(0.5), fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(5, (index) => Icon(
              index < 4 ? Icons.star : Icons.star_half,
              color: const Color(0xFFFFC107),
              size: 16,
            )),
          ),
          const SizedBox(height: 12),
          Text(
            '"Dr. Sharma was incredibly patient and\nempathetic. I felt truly heard and\nunderstood throughout our session.\nHighly recommend!"',
            style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withOpacity(0.8), height: 1.5),
          ),
          const SizedBox(height: 12),
          Text(
            '- Anonymous Patient (Mar 10)',
            style: TextStyle(fontSize: 10, color: AppTheme.textSecondary.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    // A mock list mixing Appointments and Reminders based on the images
    return Column(
      children: [
        _buildAppointmentCard(
          name: 'Patient L. Smith',
          issue: 'Dermatology Follow-up',
          time: 'Today, 10:30 AM',
        ),
        _buildReminderCard(
          name: 'Patient A. Johnson',
          issue: 'Dental Checkup',
          time: 'Tomorrow, 2:00 PM',
          duration: '15 mins before',
        ),
        _buildAppointmentCard(
          name: 'Anonymous R. Davies',
          issue: 'Orthopedic Review',
          time: 'Tomorrow, 3:30 PM',
        ),
        _buildReminderCard(
          name: 'Patient C. White',
          issue: 'Annual Physical',
          time: 'Wednesday, 9:00 AM',
          duration: '30 mins before',
        ),
        _buildAppointmentCard(
          name: 'Patient K. Brown',
          issue: 'Pediatric Consultation',
          time: 'Wednesday, 11:00 AM',
        ),
      ],
    );
  }

  Widget _buildAppointmentCard({required String name, required String issue, required String time}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textSecondary)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColorLight.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('Appointment', style: TextStyle(color: AppTheme.primaryColor, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('Health Issue: $issue', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withOpacity(0.8))),
          const SizedBox(height: 4),
          Text('Scheduled: $time', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withOpacity(0.8))),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildActionButton('Reject', AppTheme.surfaceColor, AppTheme.textSecondary)),
              const SizedBox(width: 8),
              Expanded(child: _buildActionButton('Reschedule', AppTheme.surfaceColor, AppTheme.textSecondary)),
              const SizedBox(width: 8),
              Expanded(child: _buildActionButton('Accept', AppTheme.primaryColor, Colors.white)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildReminderCard({required String name, required String issue, required String time, required String duration}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textSecondary)),
              Text('Reminder', style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 10)),
            ],
          ),
          const SizedBox(height: 12),
          Text('Health Issue: $issue', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withOpacity(0.8))),
          const SizedBox(height: 4),
          Text('Scheduled: $time', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withOpacity(0.8))),
          const SizedBox(height: 4),
          Text(duration, style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withOpacity(0.8))),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 100,
              child: _buildActionButton('Dismiss', AppTheme.surfaceColor, AppTheme.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
