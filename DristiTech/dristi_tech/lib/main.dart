import 'package:dristi_tech/features/Authentication/pages/login.dart';
import 'package:dristi_tech/features/Authentication/pages/sign_up.dart';
import 'package:dristi_tech/features/Authentication/provider/auth_provider.dart';
import 'package:dristi_tech/features/home_page.dart';
import 'package:dristi_tech/features/notes/add_notes.dart';
import 'package:dristi_tech/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(home: const HomePage()),
    );
  }
}
