import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _isLoggedIn = false; // Toggle this to test guest vs logged-in state
  final String _userName = 'Mayoori';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Curvy Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              padding: const EdgeInsets.only(bottom: 32),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0, top: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _isLoggedIn
                        ? Column(
                            children: [
                              Text(
                                _userName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isLoggedIn = false;
                                  });
                                },
                                child: Text(
                                  'Tap to Logout (Testing)',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isLoggedIn = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppTheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Login / Sign Up',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            
            // Body Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GENERAL SETTINGS',
                    style: TextStyle(
                      color: AppTheme.textSecondary.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCardTile(
                    icon: Icons.notifications_active_outlined,
                    iconColor: Colors.blue,
                    iconBgColor: Colors.blue.withOpacity(0.1),
                    title: 'Notifications',
                    subtitle: 'Toggle push alerts',
                    trailing: Switch(
                      value: _notifications,
                      onChanged: (val) => setState(() => _notifications = val),
                      activeColor: Colors.white,
                      activeTrackColor: AppTheme.primaryColor.withOpacity(0.8),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  _buildCardTile(
                    icon: Icons.language,
                    iconColor: Colors.teal,
                    iconBgColor: Colors.teal.withOpacity(0.1),
                    title: 'Language',
                    subtitle: 'Current: English',
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                  ),
                  _buildCardTile(
                    icon: Icons.dark_mode_outlined,
                    iconColor: Colors.deepPurpleAccent,
                    iconBgColor: Colors.deepPurpleAccent.withOpacity(0.1),
                    title: 'Appearance',
                    subtitle: 'Current: Light Mode',
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                  ),
                  
                  const SizedBox(height: 32),
                  Text(
                    'SUPPORT & INFO',
                    style: TextStyle(
                      color: AppTheme.textSecondary.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCardTile(
                    icon: Icons.help_outline,
                    iconColor: Colors.grey.shade700,
                    iconBgColor: Colors.grey.withOpacity(0.1),
                    title: 'Help Center',
                    subtitle: 'FAQ and support',
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardTile({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.6), fontSize: 13),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
