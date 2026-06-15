import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/role_selection_screen.dart';
import '../../features/auth/presentation/screens/auth_selection_screen.dart';
import '../../features/patient/presentation/screens/patient_sign_up_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/patient/presentation/screens/main_layout_screen.dart';
import '../../features/patient/presentation/screens/period_tracker_screen.dart';
import '../../features/patient/presentation/screens/analytics_screen.dart';
import '../../features/patient/presentation/screens/doctor_profile_screen.dart';
import '../../features/doctor/presentation/screens/doctor_sign_up_screen.dart';
import '../../features/doctor/presentation/screens/doctor_main_layout_screen.dart';
import '../../features/doctor/presentation/screens/doctor_main_layout_screen.dart';
import '../../features/patient/presentation/screens/payment_checkout_screen.dart';
import '../../features/patient/presentation/screens/card_payment_screen.dart';
import '../../features/patient/presentation/screens/gpay_payment_screen.dart';
import '../../features/patient/presentation/screens/apple_pay_payment_screen.dart';
import '../../features/doctor/presentation/screens/doctor_period_tracker_screen.dart';
import '../../features/doctor/presentation/screens/doctor_analytics_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/role-selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/auth-selection',
      builder: (context, state) {
        final role = state.extra as String? ?? 'patient';
        return AuthSelectionScreen(role: role);
      },
    ),
    GoRoute(
      path: '/patient-signup',
      builder: (context, state) => const PatientSignUpScreen(),
    ),
    GoRoute(
      path: '/doctor-signup',
      builder: (context, state) => const DoctorSignUpScreen(),
    ),
    GoRoute(
      path: '/doctor-dashboard',
      builder: (context, state) => const DoctorMainLayoutScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const MainLayoutScreen(),
    ),
    GoRoute(
      path: '/period-tracker',
      builder: (context, state) => const PeriodTrackerScreen(),
    ),
    GoRoute(
      path: '/doctor-period-tracker',
      builder: (context, state) => const DoctorPeriodTrackerScreen(),
    ),
    GoRoute(
      path: '/analytics',
      builder: (context, state) => const AnalyticsScreen(),
    ),
    GoRoute(
      path: '/doctor-analytics',
      builder: (context, state) => const DoctorAnalyticsScreen(),
    ),
    GoRoute(
      path: '/doctor-profile',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>? ?? {};
        return DoctorProfileScreen(
          doctorName: params['name'] ?? 'Dr. Anya Sharma',
          specialty: params['specialty'] ?? 'Gynecologist',
          experience: params['experience'] ?? 12,
          rating: params['rating'] ?? 4.9,
          reviews: params['reviews'] ?? '256',
          hourlyRate: params['hourlyRate'] ?? 1500.0,
        );
      },
    ),
    GoRoute(
      path: '/payment-checkout',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>? ?? {};
        return PaymentCheckoutScreen(
          doctorName: params['name'] ?? 'Dr. Anya Sharma',
          hourlyRate: params['hourlyRate'] ?? 1500.0,
        );
      },
    ),
    GoRoute(
      path: '/payment-card',
      builder: (context, state) => const CardPaymentScreen(),
    ),
    GoRoute(
      path: '/payment-gpay',
      builder: (context, state) => const GPayPaymentScreen(),
    ),
    GoRoute(
      path: '/payment-apple',
      builder: (context, state) => const ApplePayPaymentScreen(),
    ),
  ],
);
