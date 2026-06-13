import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }
}

class UploadButton extends StatelessWidget {
  final String label;
  const UploadButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.surfaceColor),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.textSecondary.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ToggleRow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleRow({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: subtitle != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: AppTheme.textSecondary.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
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

// Section 1: Personal Information
class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: '1. Personal Information'),
        const Text('Doctor\'s full name', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        const CustomTextField(hintText: 'Dr. John Doe'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'This will be kept private; only the doctor\'s auto-generated display name will be visible to patients.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Email', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        const CustomTextField(hintText: 'john.doe@example.com'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Used for verification and account-related information.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Phone (optional)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(child: CustomTextField(hintText: '+1(555) 123-4E')),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 56, // matching CustomTextField height roughly
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Send confirmation code',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(value: false, onChanged: (v) {}),
            ),
            const SizedBox(width: 8),
            const Text(
              'Enable SMS verification',
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

// Section 2: Professional Information
class ProfessionalInfoSection extends StatelessWidget {
  const ProfessionalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: '2. Professional Information'),
        const Text('Medical License Number', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(child: CustomTextField(hintText: 'MLN-1234567')),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Upload license document',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'For verification of credentials.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Specialization', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('General Medicine', style: TextStyle(color: AppTheme.textSecondary)),
              Icon(Icons.keyboard_arrow_down, color: AppTheme.textSecondary),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Years of Experience', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        const CustomTextField(hintText: '5'),
        const SizedBox(height: 16),
        const Text('Workplace(s)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(child: CustomTextField(hintText: 'e.g.,\nCity City\nGeneral', maxLines: 3)),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Upload workplace certifications',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Section 3: Consultation Preference
class ConsultationPreferenceSection extends StatelessWidget {
  const ConsultationPreferenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: '3. Consultation Preference'),
        const Text('Consultation Method', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Chat (Text consultations)', style: TextStyle(color: AppTheme.textSecondary)),
              Icon(Icons.keyboard_arrow_down, color: AppTheme.textSecondary),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Available hours', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        const CustomTextField(hintText: 'Mon-Fri, 9:00 AM - 5:00 PM'),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.calendar_today_outlined, size: 20, color: AppTheme.textSecondary),
            SizedBox(width: 8),
            Icon(Icons.access_time, size: 20, color: AppTheme.textSecondary),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'A compact availability selector will be provided\nhere for detailed day and time range configuration.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Rate per minute (optional)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        const CustomTextField(hintText: 'e.g , 2.50'),
      ],
    );
  }
}

// Section 4 & 5: Verification & Privacy
class VerificationAndPrivacySection extends StatelessWidget {
  const VerificationAndPrivacySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: '4. Verification Information'),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(
              child: Text('Professional Certifications', style: TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Upload', style: TextStyle(color: AppTheme.textSecondary, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Admin verifies professional credentials to ensure\nauthenticity and build trust.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        Row(
          children: [
            const Expanded(
              child: Text('Identity Verification', style: TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Upload', style: TextStyle(color: AppTheme.textSecondary, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Ensures the doctor is who they say they are, while\nmaintaining anonymity in consultations.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        
        const SectionHeader(title: '5. Privacy & Security Settings'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: true, 
                onChanged: (v) {},
                activeColor: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'I agree to the \'Terms of Service\' and \'Privacy\nPolicy\'',
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ensures the doctor understands and agrees to\nthe platform\'s privacy guidelines and terms.',
                    style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ToggleRow(
          title: 'Anonymous Mode',
          subtitle: 'Consultations remain anonymous by default;\nonly the doctor\'s auto-generated name will\nbe shown to the patient.',
          value: true,
          onChanged: (v) {},
        ),
      ],
    );
  }
}

// Section 6 & 7: Notifications & Final Step
class NotificationAndFinalSection extends StatelessWidget {
  const NotificationAndFinalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: '6. Notification Preferences'),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('Notification Settings', style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 14)),
        ),
        ToggleRow(
          title: 'SMS notifications',
          value: true,
          onChanged: (v) {},
        ),
        ToggleRow(
          title: 'Email notifications',
          value: true,
          onChanged: (v) {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'For new appointments, consultation reminders, and\npatient feedback.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Emergency Contact (optional)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        const CustomTextField(hintText: 'Emergency Contact'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Safety feature for doctors.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        
        const SectionHeader(title: '7. Final Verification Step'),
        const Text('Enter verification code', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(child: CustomTextField(hintText: 'Verification Code')),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Resend code',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Enter the verification code to activate the account.',
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8), fontSize: 12),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
