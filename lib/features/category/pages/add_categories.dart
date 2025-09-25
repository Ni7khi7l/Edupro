import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/category/pages/home_page.dart';
import 'package:flutter_application_1/features/category/providers/categories_provider.dart';
import 'package:flutter_application_1/features/core/enum.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final TextEditingController _category = TextEditingController();
  final TextEditingController _rating = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _classes = TextEditingController();
  final TextEditingController _durationHours = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _tab = TextEditingController();
  final TextEditingController _conclusion = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CategoriesProvider>();
      provider.addListener(() {
        if (provider.statusUtils == StatusUtils.sucess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("✅ Added Sucessfully")));
        }
        if (provider.statusUtils == StatusUtils.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("❌Invalid")));
        }
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Consumer<CategoriesProvider>(
              builder: (context, provider, child) => Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          MaterialPageRoute(builder: (_) => HomePage());
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Add Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
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
                    hintText: "Graphic Design",
                    hintStyle: TextStyle(color: Colors.black87),
                    border: OutlineInputBorder(),
                    decoration: InputDecoration(),
                    controller: _category,
                  ),
                  SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rating",
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
                    hintText: "42",
                    hintStyle: TextStyle(color: Colors.black87),
                    border: OutlineInputBorder(),
                    decoration: InputDecoration(),
                    controller: _rating,
                  ),
                  SizedBox(height: 14),
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
                        "Classes",
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
                    controller: _classes,
                  ),
                  SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Duration Hours",
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
                    hintText: "43 ",
                    hintStyle: TextStyle(color: Colors.black87),
                    border: OutlineInputBorder(),
                    decoration: InputDecoration(),
                    controller: _durationHours,
                  ),
                  SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
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
                    hintText: "300 ",
                    hintStyle: TextStyle(color: Colors.black87),
                    border: OutlineInputBorder(),
                    decoration: InputDecoration(),
                    controller: _price,
                  ),
                  SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tab",
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
                    controller: _tab,
                  ),
                  SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
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
                      hintText:
                          "Write your complain here (minimum ten characters)",
                      hintStyle: TextStyle(color: Colors.black87),
                      border: OutlineInputBorder(),
                    ),
                    controller: _conclusion,
                  ),
                  SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String? category = _category.text.trim();
                        String? rating = _rating.text.trim();
                        String? title = _title.text.trim();
                        String? classes = _classes.text.trim();
                        String? durationHours = _durationHours.text.trim();
                        String? price = _price.text.trim();
                        String? tab = _tab.text.trim();
                        String? conclusion = _conclusion.text.trim();

                        provider.addCategories(
                          category,
                          rating,
                          title,
                          classes,
                          durationHours,
                          price,
                          tab,
                          conclusion,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  bool? obscureText;
  final InputBorder? border;

  final TextEditingController? controller;
  CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.decoration,
    this.obscureText,
    this.border,
    this.hintStyle,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
