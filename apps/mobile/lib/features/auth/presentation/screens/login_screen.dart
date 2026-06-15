import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/social_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          'Log in',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomTextField(
                label: 'Phone number or Email',
                hintText: 'Enter your phone or email',
                prefixIcon: Icons.smartphone_outlined,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Continue',
                onPressed: () {
                  context.go('/dashboard');
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
              SocialLoginButton(
                text: 'Continue with Email',
                icon: Icons.email_outlined,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                text: 'Continue with Apple',
                icon: Icons.apple, // Standard material icon available
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                text: 'Continue with Google',
                icon: Icons.public, // Placeholder for Google icon without extra packages
                onPressed: () {},
              ),
              const Spacer(),
              Text(
                "Your identity is protected.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
