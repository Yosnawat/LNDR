import 'package:go_router/go_router.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/forgot_password_screen.dart'; // เพิ่มใหม่
import '../features/auth/screens/email_login_screen.dart'; // เพิ่มใหม่
import '../features/auth/screens/signup_screen.dart'; // เพิ่มใหม่
import '../features/home/screens/home_screen.dart';
import '../features/machine_detail/screens/timer_screen.dart';
import '../features/profile/screens/settings_screen.dart';
import '../features/activity/screens/report_issue_screen.dart';
import '../features/profile/screens/help_center_screen.dart';
import '../features/profile/screens/notification_screen.dart';
import '../features/machine_detail/screens/laundry_complete_screen.dart';
final router = GoRouter(
  initialLocation: '/', 
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/forgot-password', builder: (context, state) => const ForgotPasswordScreen()), // เส้นทางใหม่
    GoRoute(path: '/email-login', builder: (context, state) => const EmailLoginScreen()), // เส้นทางใหม่
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()), // เส้นทางใหม่
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/timer', builder: (context, state) => const TimerScreen()),
    GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
    GoRoute(path: '/report', builder: (context, state) => const ReportIssueScreen()),
    GoRoute(path: '/help', builder: (context, state) => const HelpCenterScreen()),
    GoRoute(path: '/notifications', builder: (context, state) => const NotificationScreen()),
    GoRoute(path: '/laundry-complete', builder: (context, state) => const LaundryCompleteScreen()),
  ],
);