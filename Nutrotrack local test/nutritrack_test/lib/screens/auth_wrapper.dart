import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/auth_state.dart';
import '../Navigation/nav_logic.dart';
import 'login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);
    return authState.isLoggedIn ? const MainScreen() : const LoginScreen();
  }
}
