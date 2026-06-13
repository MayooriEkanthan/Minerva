import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';

class DoctorSettingsScreen extends StatefulWidget {
  const DoctorSettingsScreen({super.key});

  @override
  State<DoctorSettingsScreen> createState() => _DoctorSettingsScreenState();
}

class _DoctorSettingsScreenState extends State<DoctorSettingsScreen> {
  bool voiceMaskingEnabled = false;
  bool anonymousModeEnabled = true;
  bool smsNotificationsEnabled = true;
  bool emailNotificationsEnabled = true;
  bool pushNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          children: [
            _buildProfileSection(),
            const SizedBox(height: 24),
            _buildPrivacySection(),
            const SizedBox(height: 24),
            _buildNotificationsSection(),
            const SizedBox(height: 24),
            _buildEmergencyContactSection(),
            const SizedBox(height: 24),
            _buildSupportSection(),
            const SizedBox(height: 120), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return _buildSectionContainer(
      title: 'Profile Information',
      children: [
        _buildSettingsTextField(
          label: 'Name',
          icon: Icons.person_outline,
          initialValue: 'Dr. Sarah Chen',
        ),
        const SizedBox(height: 16),
        _buildSettingsTextField(
          label: 'Specialization',
          icon: Icons.medical_services_outlined, // Stethoscope icon is not available by default, using medical services
          initialValue: 'Dermatology',
        ),
        const SizedBox(height: 16),
        _buildSettingsTextField(
          label: 'Rate per Minute (\$)',
          icon: Icons.notes,
          initialValue: '5.00',
        ),
        const SizedBox(height: 16),
        _buildSettingsTextField(
          label: 'Availability',
          icon: Icons.notifications_none,
          initialValue: 'Monday - Friday, 9 AM - 5 PM',
        ),
      ],
    );
  }

  Widget _buildPrivacySection() {
    return _buildSectionContainer(
      title: 'Privacy & Security',
      children: [
        _buildToggleItem(
          title: 'Voice Masking',
          subtitle: 'Obfuscate your voice during\nconsultations to protect your identity',
          value: voiceMaskingEnabled,
          onChanged: (val) => setState(() => voiceMaskingEnabled = val),
        ),
        const SizedBox(height: 24),
        _buildToggleItem(
          title: 'Anonymous Mode',
          subtitle: 'Hide your real name from patients,\nusing an auto-generated display\nname.',
          value: anonymousModeEnabled,
          onChanged: (val) => setState(() => anonymousModeEnabled = val),
        ),
      ],
    );
  }

  Widget _buildNotificationsSection() {
    return _buildSectionContainer(
      title: 'Notification Preferences',
      children: [
        _buildToggleItem(
          title: 'SMS Notifications',
          subtitle: 'Receive appointment reminders and\nupdates via SMS.',
          value: smsNotificationsEnabled,
          onChanged: (val) => setState(() => smsNotificationsEnabled = val),
        ),
        const SizedBox(height: 24),
        _buildToggleItem(
          title: 'Email Notifications',
          subtitle: 'Get important updates and reports\ndelivered to your email.',
          value: emailNotificationsEnabled,
          onChanged: (val) => setState(() => emailNotificationsEnabled = val),
        ),
        const SizedBox(height: 24),
        _buildToggleItem(
          title: 'Push Notifications',
          subtitle: 'Instant alerts for new messages, calls,\nand urgent updates.',
          value: pushNotificationsEnabled,
          onChanged: (val) => setState(() => pushNotificationsEnabled = val),
        ),
      ],
    );
  }

  Widget _buildEmergencyContactSection() {
    return _buildSectionContainer(
      title: 'Emergency Contact',
      children: [
        _buildSettingsTextField(
          label: 'Emergency Contact',
          icon: Icons.phone_outlined,
          initialValue: 'Dr. Emily White (555) 123-4567',
        ),
      ],
    );
  }

  Widget _buildSupportSection() {
    return _buildSectionContainer(
      title: 'Support & Account Actions',
      children: [
        _buildActionItem(
          icon: Icons.error_outline,
          title: 'Report Issue',
          onTap: () {},
        ),
        const SizedBox(height: 24),
        _buildActionItem(
          icon: Icons.support,
          title: 'Help & Support',
          onTap: () {},
        ),
        const SizedBox(height: 32),
        const Divider(color: AppTheme.surfaceColor),
        const SizedBox(height: 32),
        _buildActionItem(
          icon: Icons.logout,
          title: 'Logout',
          onTap: () {
            context.go('/role-selection');
          },
        ),
        const SizedBox(height: 24),
        _buildActionItem(
          icon: Icons.delete_outline,
          title: 'Delete Account',
          textColor: AppTheme.primaryColor,
          iconColor: AppTheme.primaryColor,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSettingsTextField({
    required String label,
    required IconData icon,
    required String initialValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: AppTheme.textSecondary.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.surfaceColor),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Icon(icon, color: AppTheme.textSecondary, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  initialValue: initialValue,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleItem({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 10,
                  color: AppTheme.textSecondary.withOpacity(0.8),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: AppTheme.primaryColor,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: AppTheme.textSecondary.withOpacity(0.8),
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = AppTheme.textSecondary,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: iconColor ?? AppTheme.textSecondary, size: 20),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
