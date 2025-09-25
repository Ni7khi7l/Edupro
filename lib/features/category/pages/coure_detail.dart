import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/category/pages/categories.dart';

class CoureDetail extends StatefulWidget {
  Categories? categories;

  CoureDetail({this.categories, super.key});

  @override
  State<CoureDetail> createState() => _CoureDetailState();
}

class _CoureDetailState extends State<CoureDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(widget.categories!.title ?? "")));
  }
}
