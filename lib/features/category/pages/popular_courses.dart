import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/category/pages/categories.dart';
import 'package:flutter_application_1/features/category/pages/coure_detail.dart';
import 'package:flutter_application_1/features/category/providers/categories_provider.dart';
import 'package:provider/provider.dart';

class PopularCourses extends StatefulWidget {
  const PopularCourses({super.key});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
  @override
  void initState() {
    context.read<CategoriesProvider>().fetchcourses();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Popular Courses",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.search),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<CategoriesProvider>(
            builder: (context, value, child) => Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 35,
                          width: 70,
                          color: const Color.fromARGB(255, 211, 209, 209),
                          child: Center(
                            child: Text(
                              "All",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 35,
                          width: 100,
                          color: const Color.fromARGB(255, 211, 209, 209),
                          child: Center(
                            child: Text(
                              "Graphic Design",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 35,
                          width: 100,
                          color: const Color.fromARGB(255, 211, 209, 209),
                          child: Center(
                            child: Text(
                              "3D Design",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 35,
                          width: 100,
                          color: const Color.fromARGB(255, 211, 209, 209),
                          child: Center(
                            child: Text(
                              "Arts",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.categoriesList.length,
                    itemBuilder: (context, index) {
                      final categories = value.categoriesList[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoureDetail(categories: Categories(

                                    category: categories["category"],
                                    rating: categories["rating"],
                                    title: categories["title"],
                                    classes: categories["classes"],
                                    durationHours: categories["durationHours"],
                                    price: categories["price"],
                                    tab: categories["tab"],
                                    conclusion: categories["conclusion"]
                                  ),),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                height: 120,
                                width: 350,
                                color: const Color.fromARGB(255, 244, 247, 249),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      color: Colors.black,
                                      child: Image.network(
                                        "https://img.freepik.com/premium-vector/vector-man-working-computer-graphic-designing-with-pen-tool_1272652-757.jpg?semt=ais_incoming&w=740&q=80",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                categories["category"],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                ),
                                              ),
                                              SizedBox(width: 60),
                                              Icon(
                                                Icons.bookmark_remove,
                                                color: Colors.green,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Graphic Design Advanced",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "7058/-",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 16,
                                              ),
                                              Text(
                                                "4.2",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                "|",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                "7830 Std",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
