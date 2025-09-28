import 'package:dristi_tech/widget/custom_text_form.dart';
import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _createdAt = TextEditingController();
  final TextEditingController _contain = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text("Add Note", style: TextStyle()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              CustomTextFormField(
                hintText: " Design Principle",
                hintStyle: TextStyle(color: Colors.black87),
                border: OutlineInputBorder(),
                decoration: InputDecoration(),
                controller: _title,
              ),
              SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Created at",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              CustomTextFormField(
                decoration: InputDecoration(
                  hintText: "21 ",
                  hintStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(),
                ),
                controller: _createdAt,
              ),
              SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contain",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              CustomTextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "21 ",
                  hintStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(),
                ),
                controller: _contain,
              ),
              SizedBox(height: 14),
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    style:
                    ElevatedButton.styleFrom(
                      elevation: 2,
                      backgroundColor: const Color.fromARGB(255, 8, 152, 219),
                      foregroundColor: Colors.white,
                    );
                  },
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
