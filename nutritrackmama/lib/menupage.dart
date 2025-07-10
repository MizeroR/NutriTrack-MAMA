import 'package:flutter/material.dart';
import 'patient-dashboard.dart';

class NutriTrackDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Section
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 32),
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 60,
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // Dashboard Cards
                DashboardCard(
                  icon: Icons.people_outline,
                  title: 'Patients Dashboard',
                  subtitle: 'Patient List Overview',
                  buttonText: 'Patient logs',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientsDashboard(),
                      ),
                    );
                  },
                ),

                SizedBox(height: 24),

                DashboardCard(
                  icon: Icons.analytics_outlined,
                  title: 'Reports & Analytics',
                  subtitle: 'Report To Doctor and schedule appointment',
                  buttonText: 'Doctor Logs',
                  onTap: () {},
                ),

                SizedBox(height: 24),

                DashboardCard(
                  icon: Icons.warning_amber_outlined,
                  title: 'Alert Management',
                  subtitle: 'Assign Follow-up',
                  buttonText: 'Period Logs',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const DashboardCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF91C788), Color(0xFF85b27c)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF91C788).withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and Title Row
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Color(0xFF91C788), size: 24),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Subtitle
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 24),

            // Action Button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF91C788),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Color(0xFF91C788), size: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
