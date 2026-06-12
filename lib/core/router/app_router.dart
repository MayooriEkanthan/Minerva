import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/role_selection_screen.dart';
import '../../features/auth/presentation/screens/auth_selection_screen.dart';
import '../../features/patient/presentation/screens/patient_sign_up_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/patient/presentation/screens/main_layout_screen.dart';

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
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const MainLayoutScreen(),
    ),
  ],
);
