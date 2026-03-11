import 'package:go_router/go_router.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/machine_detail/screens/timer_screen.dart';
import '../features/profile/screens/settings_screen.dart';
import '../features/activity/screens/report_issue_screen.dart';

final router = GoRouter(
  initialLocation: '/', // เริ่มต้นที่หน้า Splash Screen
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/timer',
      builder: (context, state) => const TimerScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/report',
      builder: (context, state) => const ReportIssueScreen(),
    ),
  ],
);