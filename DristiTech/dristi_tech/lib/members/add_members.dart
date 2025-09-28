import 'package:flutter/material.dart';

class AddMembers extends StatefulWidget {
  const AddMembers({super.key});

  @override
  State<AddMembers> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  final TextEditingController _profile = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("22 December 2023", style: TextStyle(color: Colors.black54)),
              const Spacer(),
              Icon(Icons.add_circle_outline_outlined, color: Colors.blue),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                "DristiTech ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 4),
              Text(
                "Add Members ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
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
          Text(
            "Profile",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Ishan Shrestha",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            controller: _profile,
          ),
          SizedBox(height: 16),
          Text(
            " Email ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Ishan Shrestha",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            controller: _email,
          ),
          SizedBox(height: 16),

          Text(
            " Phone Number ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Ishan Shrestha",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            controller: _phoneNumber,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
