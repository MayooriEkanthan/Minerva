import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/secondary_button.dart';

class AuthSelectionScreen extends StatelessWidget {
  final String role; // 'doctor' or 'patient'

  const AuthSelectionScreen({super.key, required this.role});

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
                text: "I'm new — Sign Up",
                icon: Icons.monitor_heart_outlined,
                onPressed: () {
                  if (role == 'patient') {
                    context.push('/patient-signup');
                  } else {
                    // Navigate to specific signup based on doctor role later
                  }
                },
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  const Expanded(child: Divider(color: AppTheme.surfaceColor, thickness: 2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "or",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                    ),
                  ),
                  const Expanded(child: Divider(color: AppTheme.surfaceColor, thickness: 2)),
                ],
              ),
              const SizedBox(height: 32),
              SecondaryButton(
                text: "I already have an account — Log In",
                onPressed: () {
                  context.push('/login');
                },
              ),
              const Spacer(),
              Text(
                "Your identity is protected.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary.withOpacity(0.8),
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
