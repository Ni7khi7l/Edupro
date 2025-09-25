import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/Provider/auth_provider.dart';
import 'package:flutter_application_1/features/auth/pages/sign_up.dart';
import 'package:flutter_application_1/features/category/pages/home_page.dart';
import 'package:flutter_application_1/features/core/enum.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AuthProvider>();

      provider.addListener(() {
        if (provider.statusUtils == StatusUtils.sucess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Signup Sucessful!")));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
            (route) => false,
          );
        }
        if (provider.statusUtils == StatusUtils.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Invalid")));
        }
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 173, 205, 232),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) => Column(
                children: [
                  SizedBox(height: 36),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://play-lh.googleusercontent.com/j7J-8dPrRLRhuGURXXANt_mtutBZgOmDxVxJLgN_dX9sJywAKdnDX40RS_eQdQHqB64",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Getting Started"),
                  SizedBox(height: 16),
                  Text("Log in to you  Account to Continue your all Courses"),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    decoration: InputDecoration(),
                    controller: _emailController,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off),
                    decoration: InputDecoration(fillColor: Colors.white),

                    controller: _passwordController,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.check_box, color: Colors.blue),
                      Text("Remember Me"),
                      Spacer(),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text("Agree to terms and condition"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      backgroundColor: Colors.lightBlueAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      provider.signin(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(height: 20),
                  Text("or COntinue With"),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://53.fs1.hubspotusercontent-na1.net/hubfs/53/image8-2.jpg",
                        ),
                      ),
                      SizedBox(width: 20),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://static.vecteezy.com/system/resources/thumbnails/019/763/812/small/apple-logo-apple-icon-free-free-vector.jpg",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an Account?"),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SignUp()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
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
  final InputDecoration? decoration;

  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.decoration,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
