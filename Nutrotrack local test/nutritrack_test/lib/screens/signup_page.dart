import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_auth_button.dart';
import '../screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              // Logo Image
              Container(
                width: 120,
                height: 60,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 60),

              // Error Message
              if (authState.errorMessage != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red[200]!),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red[700],
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          authState.errorMessage!,
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => authState.clearError(),
                        child: Icon(
                          Icons.close,
                          color: Colors.red[700],
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name Field
                    AuthTextField(
                      controller: _nameController,
                      hintText: 'Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Email Field
                    AuthTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    AuthTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Terms and Privacy Checkbox
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      authState.setAgreeToTerms(!authState.agreeToTerms);
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: authState.agreeToTerms
                              ? const Color(0xFF91C788)
                              : const Color(0xFFD1D5DB),
                          width: 2,
                        ),
                        color: authState.agreeToTerms
                            ? const Color(0xFF91C788)
                            : Colors.transparent,
                      ),
                      child: authState.agreeToTerms
                          ? const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'I agree with the Terms of Service & Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Already have an account? Log In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Color(0xFF6B7280)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const LoginScreen(),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                          transitionDuration: const Duration(milliseconds: 200),
                        ),
                      );
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Color(0xFF91C788),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              // Social Sign In Buttons
              Row(
                children: [
                  Expanded(
                    child: SocialAuthButton(
                      iconText: 'G',
                      label: 'Google',
                      onPressed: authState.isLoading
                          ? null
                          : () => authState.signInWithGoogle(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SocialAuthButton(
                      iconText: 'f',
                      label: 'Facebook',
                      onPressed: authState.isLoading
                          ? null
                          : () => authState.signInWithFacebook(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Get Started Button
              GestureDetector(
                onTap: authState.isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          await authState.register(
                            _nameController.text.trim(),
                            _emailController.text.trim(),
                            _passwordController.text,
                          );
                        }
                      },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF91C788),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: authState.isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : const Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
