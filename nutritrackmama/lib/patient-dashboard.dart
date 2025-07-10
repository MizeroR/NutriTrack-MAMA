import 'package:flutter/material.dart';
import 'patient-overview.dart';

class PatientsDashboard extends StatefulWidget {
  @override
  _PatientsDashboardState createState() => _PatientsDashboardState();
}

class _PatientsDashboardState extends State<PatientsDashboard> {
  final TextEditingController _searchController = TextEditingController();

  final List<Patient> patients = [
    Patient(
      name: 'Joseline',
      age: 23,
      duration: '3 months',
      visits: 4,
      statusColor: Colors.red,
      hasNewMessage: true,
    ),
    Patient(
      name: 'Teta Natalie',
      age: 30,
      duration: '3 months',
      visits: 7,
      statusColor: Colors.yellow,
      hasNewMessage: false,
    ),
    Patient(
      name: 'Marine Uwase',
      age: 35,
      duration: '5 months',
      visits: 5,
      statusColor: Colors.yellow,
      hasNewMessage: false,
    ),
    Patient(
      name: 'Ineza Gloria',
      age: 28,
      duration: '1 months',
      visits: 2,
      statusColor: Colors.green,
      hasNewMessage: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person_outline, color: Colors.green),
        ),
        title: Text(
          'Patients Dashboard',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.green, size: 20),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search (${patients.length} Patients)',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.tune, color: Colors.green, size: 20),
              ],
            ),
          ),

          // Sort Button
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'AZ',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Sort by',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Patients Grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return PatientCard(patient: patients[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (patient.name == 'Teta Natalie') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientOverviewScreen(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile and Status Row
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey.shade600,
                          size: 24,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: patient.statusColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.phone, color: Colors.grey.shade400, size: 20),
                  SizedBox(width: 12),
                  Stack(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                      if (patient.hasNewMessage)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Patient Name
              Text(
                patient.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 12),

              // Age and Duration
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${patient.age}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade700,
                          ),
                        ),
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Text(
                          patient.duration.split(' ')[0],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade700,
                          ),
                        ),
                        Text(
                          patient.duration.split(' ')[1],
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              // Visits
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Visited: ${patient.visits} Times',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Patient {
  final String name;
  final int age;
  final String duration;
  final int visits;
  final Color statusColor;
  final bool hasNewMessage;

  Patient({
    required this.name,
    required this.age,
    required this.duration,
    required this.visits,
    required this.statusColor,
    required this.hasNewMessage,
  });
}