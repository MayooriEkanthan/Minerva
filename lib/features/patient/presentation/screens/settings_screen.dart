import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _anonymousMode = true;
  bool _voiceMasking = true;
  bool _autoDeleteChats = false;
  bool _autoDeleteReports = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: AppTheme.textSecondary, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Privacy Controls'),
            _buildToggleTile(
              title: 'Anonymous mode',
              subtitle: 'Your identity is completely hidden from doctors and other users.',
              value: _anonymousMode,
              onChanged: (val) => setState(() => _anonymousMode = val),
            ),
            const Divider(color: AppTheme.surfaceColor),
            _buildToggleTile(
              title: 'Voice masking',
              subtitle: 'Disguise your voice during calls for added anonymity.',
              value: _voiceMasking,
              onChanged: (val) => setState(() => _voiceMasking = val),
            ),
            const Divider(color: AppTheme.surfaceColor),
            _buildToggleTile(
              title: 'Auto-delete chats',
              subtitle: 'Automatically clear chat history after consultations are complete.',
              value: _autoDeleteChats,
              onChanged: (val) => setState(() => _autoDeleteChats = val),
            ),
            const Divider(color: AppTheme.surfaceColor),
            _buildToggleTile(
              title: 'Auto-delete reports',
              subtitle: 'Remove consultation reports from your device after a set period.',
              value: _autoDeleteReports,
              onChanged: (val) => setState(() => _autoDeleteReports = val),
            ),
            const Divider(color: AppTheme.surfaceColor),
            
            const SizedBox(height: 32),
            _buildSectionHeader('User Preferences'),
            _buildNavTile(title: 'Consultation type', trailingText: 'Chat'),
            const Divider(color: AppTheme.surfaceColor),
            _buildNavTile(title: 'Voice style', trailingText: 'Deep Tone'),
            const Divider(color: AppTheme.surfaceColor),
            _buildNavTile(title: 'Language', trailingText: 'English'),
            const Divider(color: AppTheme.surfaceColor),
            _buildNavTile(title: 'Font size', trailingText: 'Medium'),
            const Divider(color: AppTheme.surfaceColor),
            
            const SizedBox(height: 32),
            _buildSectionHeader('Support & Account'),
            _buildNavTile(title: 'Report doctor'),
            const Divider(color: AppTheme.surfaceColor),
            _buildNavTile(title: 'Help & support'),
            const Divider(color: AppTheme.surfaceColor),
            _buildNavTile(title: 'Emergency contacts'),
            const Divider(color: AppTheme.surfaceColor),
            _buildNavTile(title: 'Logout'),
            const Divider(color: AppTheme.surfaceColor),
            _buildNavTile(title: 'Delete account permanently', isDestructive: true),
            const Divider(color: AppTheme.surfaceColor),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildToggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.textSecondary.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppTheme.textSecondary.withOpacity(0.4),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppTheme.primaryColor,
            activeTrackColor: AppTheme.primaryColor.withOpacity(0.3),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _buildNavTile({
    required String title,
    String? trailingText,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isDestructive ? AppTheme.primaryColor.withOpacity(0.8) : AppTheme.textSecondary.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                if (trailingText != null) ...[
                  Text(
                    trailingText,
                    style: TextStyle(
                      color: AppTheme.textSecondary.withOpacity(0.4),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                if (!isDestructive)
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.textSecondary.withOpacity(0.4),
                    size: 14,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
