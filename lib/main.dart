import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: const LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // For Validating Forms
  final formkey = GlobalKey<FormState>();

  // For Checkbox control
  bool checkboxvalue = false;

  // Controllers for TextFields
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _username,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your Username";
                  }
                  // else if (value.length >= 10) {
                  //   return "Name too Long";
                  // }
                  else if (value.length <= 5) {
                    return "Name too short";
                  }
                  return null;
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 2.2,
                ),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: " Enter Username",
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your Password";
                  }
                  // else if (value.length >= 10) {
                  //   return "Password too Long";
                  // }
                  else if (value.length <= 5) {
                    return "Password too short";
                  }
                  return null;
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 2.2,
                ),
                obscureText: !checkboxvalue,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  hintText: " Password",
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  print("Validated");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.black,
                      content: const Text(
                        'Login In Successful',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Okay',
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}