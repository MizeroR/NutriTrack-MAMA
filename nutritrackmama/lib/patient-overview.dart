import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Overview',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: PatientOverviewScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PatientOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_circle_left_outlined, color: Color(0xff90d57e)),
          onPressed: () {},
        ),
        title: Text(
          'Patient overview',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Main patient card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff85b27c),
                      Color(0xff91b78a),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Header with avatar and dropdown
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.white.withOpacity(0.7),
                              size: 120,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Last Week',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),

                      // Patient name
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Teta Natalie',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // BMI Section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xff619059),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Body Mass Index (BMI)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    '24.9',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Text(
                                    'Healthy',
                                    style: TextStyle(
                                      color: Color(0xff111611),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Text(
                            //   '24.9',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 28,
                            //     // fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(height: 15),

                            // BMI Scale
                            Container(
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.yellow,
                                    Colors.lightGreen,
                                    Colors.green,
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('15',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text('18.5',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text('25',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text('30',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text('40',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Medical Treatment Section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Medical Treatment',
                                  style: TextStyle(
                                    color: Color(0xff0a0a0a),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 14),
                                // Row(
                                //   children: [
                                Flexible(
                                  child: Text(
                                    '20% Higher than last month',
                                    style: TextStyle(
                                      color: Colors.green[500],
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.green,
                                  size: 16,
                                ),
                              ],
                              //   ),
                              // ],
                            ),
                            SizedBox(height: 10),

                            // Stats Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Overall Growth',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '38.40%',
                                        style: TextStyle(
                                          // color: Colors.grey[800],
                                          color: Color(0xff0a0a0a),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Monthly',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '52.49%',
                                        style: TextStyle(
                                          // color: Colors.grey[800],
                                          color: Color(0xff0a0a0a),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Day',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        '4.70%',
                                        style: TextStyle(
                                          // color: Colors.grey[800],
                                          color: Color(0xff0a0a0a),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),

                            // Chart
                            Container(
                              height: 120,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 20,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            value.toInt().toString(),
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 10,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          const months = [
                                            'Jan',
                                            'Feb',
                                            'Mar',
                                            'Apr',
                                            'May',
                                            'Jun',
                                            'Jul',
                                            'Aug'
                                          ];
                                          if (value.toInt() < months.length) {
                                            return Text(
                                              months[value.toInt()],
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 10,
                                              ),
                                            );
                                          }
                                          return Text('');
                                        },
                                      ),
                                    ),
                                    rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    topTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                  ),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    // Green dotted line
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, 80),
                                        FlSpot(1, 75),
                                        FlSpot(2, 85),
                                        FlSpot(3, 90),
                                        FlSpot(4, 95),
                                        FlSpot(5, 85),
                                        FlSpot(6, 70),
                                        FlSpot(7, 60),
                                      ],
                                      isCurved: true,
                                      color: Colors.red,
                                      barWidth: 2,
                                      isStrokeCapRound: true,
                                      dotData: FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) =>
                                                FlDotCirclePainter(
                                          radius: 3,
                                          color: Colors.red,
                                          strokeWidth: 0,
                                        ),
                                      ),
                                      dashArray: [5, 5],
                                    ),
                                    // Dark green solid line
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, 50),
                                        FlSpot(1, 55),
                                        FlSpot(2, 45),
                                        FlSpot(3, 35),
                                        FlSpot(4, 30),
                                        FlSpot(5, 25),
                                        FlSpot(6, 30),
                                        FlSpot(7, 25),
                                      ],
                                      isCurved: true,
                                      color: Colors.green[800],
                                      barWidth: 3,
                                      isStrokeCapRound: true,
                                      dotData: FlDotData(show: false),
                                    ),
                                    // Light green dashed line
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, 60),
                                        FlSpot(1, 65),
                                        FlSpot(2, 55),
                                        FlSpot(3, 45),
                                        FlSpot(4, 35),
                                        FlSpot(5, 40),
                                        FlSpot(6, 45),
                                        FlSpot(7, 35),
                                      ],
                                      isCurved: true,
                                      color: Colors.yellow[300],
                                      barWidth: 2,
                                      isStrokeCapRound: true,
                                      dotData: FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) =>
                                                FlDotCirclePainter(
                                          radius: 4,
                                          color: Colors.yellow[300]!,
                                          strokeWidth: 0,
                                        ),
                                      ),
                                      dashArray: [3, 3],
                                    ),
                                  ],
                                  minX: 0,
                                  maxX: 7,
                                  minY: 0,
                                  maxY: 120,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // bottom padding for better scroll experience
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

