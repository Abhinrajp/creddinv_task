import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/login_screen.dart';

class LuxeCartApp extends StatelessWidget {
  const LuxeCartApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Luxe Cart',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const LoginScreen(),
      );
}
