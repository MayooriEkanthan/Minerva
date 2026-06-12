import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../../../../core/widgets/primary_button.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MinervaLogo(size: 64),
              const SizedBox(height: 32),
              Text(
                "Your identity is protected. Minerva\noffers anonymous women's health\nconsultations.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 64),
              PrimaryButton(
                text: "I'm Doctor",
                icon: Icons.monitor_heart_outlined,
                onPressed: () {
                  context.push('/auth-selection', extra: 'doctor');
                },
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: "I'm Minerva User",
                icon: Icons.monitor_heart_outlined,
                onPressed: () {
                  context.push('/auth-selection', extra: 'patient');
                },
              ),
              const Spacer(),
              Text(
                "Your identity is protected.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary.withOpacity(0.5),
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
