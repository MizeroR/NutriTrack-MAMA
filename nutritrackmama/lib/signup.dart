import 'package:flutter/material.dart';
import 'menupage.dart';
import 'login.dart';

// Auth State Model using ChangeNotifier (built into Flutter)
class AuthState extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _user;
  String? _errorMessage;
  bool _agreeToTerms = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get agreeToTerms => _agreeToTerms;

  void setAgreeToTerms(bool value) {
    _agreeToTerms = value;
    notifyListeners();
  }

  Future<void> register(String name, String email, String password) async {
    if (!_agreeToTerms) {
      _errorMessage = 'Please agree to the Terms of Service & Privacy Policy';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Simple validation (replace with real auth logic)
      if (name.isNotEmpty && email.isNotEmpty && password.length >= 6) {
        _isLoggedIn = true;
        _user = name;
        _errorMessage = null;
      } else {
        throw Exception('Please fill all fields correctly');
      }
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));
      _isLoggedIn = true;
      _user = "Google User";
      _errorMessage = null;
    } catch (e) {
      _errorMessage = "Google sign-in failed";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithFacebook() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));
      _isLoggedIn = true;
      _user = "Facebook User";
      _errorMessage = null;
    } catch (e) {
      _errorMessage = "Facebook sign-in failed";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _isLoggedIn = false;
    _user = null;
    _errorMessage = null;
    _agreeToTerms = false;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}

// Global instance of AuthState
final AuthState authState = AuthState();

// Main App
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriTrack Mama',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        fontFamily: 'SF Pro Display', // iOS-like font
      ),
      home: const AuthWrapper(),
    );
  }
}

// Auth Wrapper to handle navigation based on auth state
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Listen to auth state changes
    authState.addListener(_onAuthStateChanged);
  }

  @override
  void dispose() {
    authState.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  void _onAuthStateChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (authState.isLoggedIn) {
      return NutriTrackDashboard(); // Changed from HomePage to BlankPage
    } else {
      return const SignUpPage();
    }
  }
}

// Sign Up Page matching the Figma design
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listen to auth state changes
    authState.addListener(_onAuthStateChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    authState.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  void _onAuthStateChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Email Field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
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
                    ),

                    const SizedBox(height: 16),

                    // Password Field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
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

              // Social Sign In Buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: authState.isLoading
                          ? null
                          : () {
                              authState.signInWithGoogle();
                            },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'G',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF91C788),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Google',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: authState.isLoading
                          ? null
                          : () {
                              authState.signInWithFacebook();
                            },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'f',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF91C788),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Get Started Button (removed arrow)
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
                          if (authState.isLoggedIn) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NutriTrackDashboard(),
                              ),
                            );
                          }
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
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF91C788),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
