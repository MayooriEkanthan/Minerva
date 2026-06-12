import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_segmented_control.dart';
import '../../../../core/widgets/primary_button.dart';

class PatientSignUpScreen extends StatefulWidget {
  const PatientSignUpScreen({super.key});

  @override
  State<PatientSignUpScreen> createState() => _PatientSignUpScreenState();
}

class _PatientSignUpScreenState extends State<PatientSignUpScreen> {
  final List<String> _healthIssues = [
    'Period issues',
    'Breast health',
    'Mental wellness',
    'Fertility',
    'PCOS/PCOD',
  ];
  final Map<String, bool> _selectedIssues = {};
  
  bool _emailNotif = false;
  bool _smsNotif = false;
  bool _termsConsent = false;
  bool _privacyConsent = false;

  @override
  void initState() {
    super.initState();
    for (var issue in _healthIssues) {
      _selectedIssues[issue] = false;
    }
  }

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
          'Sign Up',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextField(
              label: 'Display Name',
              hintText: 'AnonymousUser123',
              helperText: 'This is an auto-generated suggestion.',
            ),
            const SizedBox(height: 24),
            Text(
              'Contact Method',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8),
            CustomSegmentedControl(
              options: const ['Phone', 'Email'],
              onChanged: (index) {},
            ),
            const SizedBox(height: 24),
            const CustomTextField(
              label: 'Country Code',
              hintText: '+1',
              isOptional: true,
            ),
            const SizedBox(height: 24),
            const CustomTextField(
              label: 'Date of Birth',
              hintText: 'Pick a date',
              prefixIcon: Icons.calendar_today_outlined,
              isOptional: true,
            ),
            const SizedBox(height: 24),
            Text(
              'Occupation Category',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8),
            CustomSegmentedControl(
              options: const ['Student', 'Working\nlady', 'Housewife', 'Elderly\nwoman'],
              onChanged: (index) {},
            ),
            const SizedBox(height: 24),
            Text(
              'Secure NIC/ID Proof (Optional)',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(AppTheme.defaultRadius),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(Icons.file_upload_outlined, color: AppTheme.textSecondary),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Optional — used only for verification, kept private.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: AppTheme.textSecondary.withOpacity(0.7),
                  ),
            ),
            const SizedBox(height: 24),
            const CustomTextField(
              label: 'Country/Region',
              hintText: 'Select Country',
              isOptional: true,
            ),
            const SizedBox(height: 24),
            Text(
              'Health Issues (Optional)',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(AppTheme.defaultRadius),
              ),
              child: Column(
                children: _healthIssues.map((issue) {
                  return CheckboxListTile(
                    title: Text(issue, style: Theme.of(context).textTheme.bodyMedium),
                    value: _selectedIssues[issue],
                    onChanged: (val) {
                      setState(() {
                        _selectedIssues[issue] = val!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    activeColor: AppTheme.primaryColor,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Preferred Consultation Type',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8),
            CustomSegmentedControl(
              options: const ['Chat', 'Voice'],
              onChanged: (index) {},
            ),
            const SizedBox(height: 24),
            const CustomTextField(
              label: 'Emergency Contact',
              hintText: 'Name, Phone Number, Relationship',
              isOptional: true,
            ),
            const SizedBox(height: 24),
            Text(
              'Notification Preferences',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(AppTheme.defaultRadius),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text('Email Notifications', style: Theme.of(context).textTheme.bodyMedium),
                    value: _emailNotif,
                    onChanged: (val) => setState(() => _emailNotif = val),
                    activeColor: AppTheme.primaryColor,
                  ),
                  SwitchListTile(
                    title: Text('SMS Notifications', style: Theme.of(context).textTheme.bodyMedium),
                    value: _smsNotif,
                    onChanged: (val) => setState(() => _smsNotif = val),
                    activeColor: AppTheme.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CheckboxListTile(
              title: RichText(
                text: TextSpan(
                  text: 'I consent to the ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: const [
                    TextSpan(
                      text: 'Terms of Service.',
                      style: TextStyle(color: Colors.lightBlue), // Or your preferred link color
                    ),
                  ],
                ),
              ),
              value: _termsConsent,
              onChanged: (val) => setState(() => _termsConsent = val!),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: AppTheme.primaryColor,
            ),
            CheckboxListTile(
              title: RichText(
                text: TextSpan(
                  text: 'I agree to the ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: const [
                    TextSpan(
                      text: 'PrivacyPolicy.',
                      style: TextStyle(color: Colors.lightBlue), // Or your preferred link color
                    ),
                  ],
                ),
              ),
              value: _privacyConsent,
              onChanged: (val) => setState(() => _privacyConsent = val!),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: AppTheme.primaryColor,
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'Create Account',
              onPressed: () {
                // Submit form
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'No profile required — we protect your identity.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary.withOpacity(0.5),
                    ),
              ),
            ),
            const SizedBox(height: 48), // Bottom padding for scroll
          ],
        ),
      ),
    );
  }
}
