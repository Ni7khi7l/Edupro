import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/Provider/auth_provider.dart';
import 'package:flutter_application_1/features/auth/pages/login.dart';
import 'package:flutter_application_1/features/core/enum.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isvisible = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AuthProvider>();

      provider.addListener(() {
        if (provider.statusUtils == StatusUtils.sucess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Signup Sucessful!")));
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
      backgroundColor: Color.fromARGB(255, 237, 246, 247),
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
                  SizedBox(height: 48),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Sign In..!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create your  Account to Continue your Courses",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 91, 91, 91),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 36),
                  CustomTextFormField(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black87),
                    prefixIcon: Icon(Icons.email_outlined),
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: _emailController,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.black87),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      child: isvisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                    decoration: InputDecoration(),
                    obscureText: isvisible ? false : true,

                    controller: _passwordController,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        ),
                      ),
                      Text("Agree to Terms & Conditions"),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      backgroundColor: Colors.lightBlueAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      provider.signup(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Login()),
                      );
                    },
                    child: Text("Sign Up"),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Or Continue With",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
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
                      Text(
                        "Already have an Account?",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Login()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
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
