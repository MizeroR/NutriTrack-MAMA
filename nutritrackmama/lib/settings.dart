import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Personal Info Section
            _buildSectionTitle('Personal Info'),
            const SizedBox(height: 16),
            _buildSettingsCard([
              _buildSettingsItem(
                icon: Icons.person_outline,
                title: 'Your profile',
                onTap: () {},
              ),
              _buildSettingsItem(
                icon: Icons.history,
                title: 'History Transaction',
                onTap: () {},
              ),
            ]),
            _buildSectionDivider(),

            const SizedBox(height: 32),

            // Security Section
            _buildSectionTitle('Security'),
            const SizedBox(height: 16),
            _buildSettingsCard([
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
            _buildSectionDivider(),

            const SizedBox(height: 32),

            // General Section
            _buildSectionTitle('General'),
            const SizedBox(height: 16),
            _buildSettingsCard([
              _buildSettingsItem(
                icon: Icons.notifications_outlined,
                title: 'Notification',
                onTap: () {},
              ),
              _buildSettingsItem(
                icon: Icons.language_outlined,
                title: 'Languages',
                onTap: () {},
              ),
              _buildSettingsItem(
                icon: Icons.help_outline,
                title: 'Help and Support',
                onTap: () {},
              ),
            ]),

            const SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Column(children: children);
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[600], size: 24),
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
            Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionDivider() {
    return Divider(
      color: Colors.black,
      thickness: 1,
      height: 20,
    );
  }
}
