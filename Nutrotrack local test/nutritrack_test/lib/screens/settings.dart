import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // Personal Info Section
            _buildSectionHeader('Personal Info'),
            _buildSettingsGroup([
              _buildSettingsItem(
                icon: Icons.person_outline,
                title: 'Your profile',
                onTap: () {},
              ),
              _buildSettingsItem(
                icon: Icons.refresh,
                title: 'History Transaction',
                onTap: () {},
              ),
            ]),
            
            const SizedBox(height: 30),
            
            // Security Section
            _buildSectionHeader('Security'),
            _buildSettingsGroup([
              _buildSettingsItem(
                icon: Icons.lock_outline,
                title: 'Change password',
                onTap: () {},
              ),
              _buildSettingsItem(
                icon: Icons.lock_outline,
                title: 'Forgot password',
                onTap: () {},
              ),
            ]),
            
            const SizedBox(height: 30),
            
            // General Section
            _buildSectionHeader('General'),
            _buildSettingsGroup([
              _buildSettingsItem(
                icon: Icons.notifications_none,
                title: 'Notification',
                onTap: () {},
              ),
              _buildSettingsItem(
                icon: Icons.language,
                title: 'Languages',
                onTap: () {},
              ),
            ]),
            
            const SizedBox(height: 30),
            
            // Help and Support Section
            _buildSectionHeader('Help and Support'),
            _buildSettingsGroup([
              _buildSettingsItem(
                icon: Icons.help_outline,
                title: 'Help and Support',
                onTap: () {},
                showArrow: false,
              ),
            ]),
            
            const SizedBox(height: 100), // Space for floating action button
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[400],
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_outlined),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white, size: 16),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: 3,
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showArrow = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: Colors.black87,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (showArrow)
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage Example
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SettingsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}