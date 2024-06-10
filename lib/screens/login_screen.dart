import 'package:flutter/material.dart';
import 'package:yomicepa_mobile_task/apis/login_apis.dart';
import 'package:yomicepa_mobile_task/screens/return_requests_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isPasswordObscured = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 50),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome 👋", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28)),
                const Row(
                  children: [
                    Text("to ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28)),
                    Text("PharmEasy", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.normal, fontSize: 28)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Hello there, login to continue", style: TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 335,
                    child: TextFormField(
                      cursorColor: Colors.blue,
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.blue)),
                        label: Text("Username", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.blue)),
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 335,
                    child: TextFormField(
                      obscureText: _isPasswordObscured,
                      cursorColor: Colors.blue,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordObscured = !_isPasswordObscured;
                            });
                          },
                          icon: Icon(
                            _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                        label: const Text("Password", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.blue)),
                        focusedBorder:
                            const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder:
                            const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.blue)),
                        contentPadding: const EdgeInsets.all(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 335,
                    child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final user = await LoginApi().login(
                              _usernameController.text.trim(),
                              _passwordController.text.trim(),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ReturnRequestsScreen(user: user)),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: (e.toString() == "Exception: Failed to load data: 401 " ?const Text('Login failed: Wrong Username or Password'):Text('Login failed: ${e.toString()}')),
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Colors.blue)),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
