import 'package:dristi_tech/features/Attendance/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAttendance extends StatefulWidget {
  const AddAttendance({super.key});

  @override
  State<AddAttendance> createState() => _AddAttendanceState();
}

class _AddAttendanceState extends State<AddAttendance> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _todaysDate = TextEditingController();
  final TextEditingController _contains = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AttendanceProvider>(
            builder: (context, provider, child) => Column(
              children: [
                Row(
                  children: [
                    Text(
                      "22 December 2023",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const Spacer(),
                    Icon(Icons.add_circle_outline_outlined, color: Colors.blue),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 30),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Search for..",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.all(4), // space inside the border
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightBlueAccent),
                            color: Colors.lightBlueAccent,
                          ),
                          child: Icon(Icons.tune, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),
                Text(
                  "DristiTech Attendance",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),

                Text(
                  "Title",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ishan Shrestha",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _title,
                ),
                SizedBox(height: 16),
                Text(
                  " Today's Date",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ishan Shrestha",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _todaysDate,
                ),
                SizedBox(height: 16),
                Text(
                  "Contains",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ishan Shrestha",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _contains,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    minimumSize: Size(double.infinity, 40),
                  ),
                  onPressed: () {
                    String? title = _title.text.trim();
                    String? todaysdate = _todaysDate.text.trim();
                    String? contains = _contains.text.trim();

                    provider.addattendance(title, todaysdate, contains);
                  },
                  child: Text("Attendance"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
