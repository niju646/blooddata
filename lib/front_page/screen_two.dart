import 'package:blooddata/secure/flutter_secure.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),

                  // Username Field
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is empty";
                        }
                        return null;
                      },
                      controller: _usernameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Email or Username',
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        errorStyle: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Password Field
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is empty";
                        }
                        if (value.length < 8) {
                          return 'Enter at least 8 characters';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        border: const OutlineInputBorder(),
                        errorStyle: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sign-In Button
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 70, 59)),
                      onPressed: () {
                        SecureStorage().writeSecureData(
                            _usernameController.text, _passwordController.text);
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        }
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void checkLogin(BuildContext ctx) {
  //   final _username = _usernameController.text.trim();
  //   final _password = _passwordController.text.trim();

  //   if (_username == "thejus" && _password == "12345678") {
  //     // Successful login
  //     ScaffoldMessenger.of(ctx).showSnackBar(
  //       const SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         margin: EdgeInsets.all(10),
  //         content: Text('Login successful'),
  //       ),
  //     );

  //     // Navigate to Userpage
  //     Navigator.of(ctx)
  //         .pushNamed('Userpage', arguments: _usernameController.text);
  //   } else {
  //     // Login failed
  //     ScaffoldMessenger.of(ctx).showSnackBar(
  //       const SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         margin: EdgeInsets.all(10),
  //         content: Text('Invalid username or password'),
  //       ),
  //     );
  //   }
  // }

  void checkLogin(BuildContext ctx) {
  final _username = _usernameController.text.trim();
  final _password = _passwordController.text.trim();

  if (_username == "admin" && _password == "adminpassword") {
    // Admin login successful
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Admin login successful'),
      ),
    );

    // Navigate to Admin page
    Navigator.of(ctx).pushNamed('admin');
  } else if (_username == "thejus" && _password == "12345678") {
    // User login successful
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Login successful'),
      ),
    );

    // Navigate to User page
    Navigator.of(ctx).pushNamed('Userpage', arguments: _username);
  } else {
    // Login failed
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Invalid username or password'),
      ),
    );
  }
}

}
