import 'package:design_system/theme/theme_extensions/app_colors.dart';
import 'package:features_auth/features_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/routes/app_routes.dart';

/// Login page with BLoC pattern
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.baseUrl, required this.loginUrl});

  final String baseUrl;
  final String loginUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          debugPrint('LoginPage - State changed: ${state.runtimeType}');

          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: theme.colorScheme.error,
              ),
            );
            AppRoutes.navigateToDashboard(context);
          } else if (state is AuthAuthenticated) {
            debugPrint(
              'LoginPage - User authenticated: ${state.user.fullName}',
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Login successful!'),
                backgroundColor:
                    theme.extension<AppColorsExtension>()?.success ??
                    Colors.green,
              ),
            );

            // Navigate to home after successful login
            debugPrint('LoginPage - Navigating to home...');
            AppRoutes.navigateToHome(context);
          }
        },
        builder: (context, state) {
          debugPrint('LoginPage - Building with state: ${state.runtimeType}');

          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return LoginForm(baseUrl: baseUrl, loginUrl: loginUrl);
        },
      ),
    );
  }
}
