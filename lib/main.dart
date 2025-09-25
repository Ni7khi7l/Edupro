import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/Provider/auth_provider.dart';
import 'package:flutter_application_1/features/auth/pages/sign_up.dart';
import 'package:flutter_application_1/features/category/pages/home_page.dart';
import 'package:flutter_application_1/features/category/providers/categories_provider.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        home: Consumer<AuthProvider>(
          builder: (context, authprovider, child) =>
              authprovider.isLoggedin ? HomePage() : SignUp(),
        ),
      ),
    );
  }
}
