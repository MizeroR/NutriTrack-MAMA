import 'package:flutter/material.dart';

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
      await Future.delayed(const Duration(seconds: 2));

      if (name.isNotEmpty && email.isNotEmpty && password.length >= 6) {
        _isLoggedIn = true;
        _user = name;
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

final AuthState authState = AuthState();
