import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reg_rota_pad/widgets/reg_rota_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dashboard.dart'; // Import your dashboard screen here

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? myStringValue;

  void _saveDataLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
  }

  @override
  void initState() {
    super.initState();
    getStringFromSharedPreferences().then((value) {
      setState(() {
        myStringValue = value;
      });
    });
  }

  Future<String?> getStringFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('url'); // Replace 'key' with your key
    return stringValue;
  }

  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    final Uri url = Uri.parse(myStringValue ??
        'String not found in SharedPreferences'); // Replace with your login API URL

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    // const headers = {
    //   'Content-Type': 'text/plain' // Set the content type to plain text
    // };

    final Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    print(response.body);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Dashboard(), // Navigate to your dashboard screen
      ),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print('object');
      print(responseData);
      print('Login successful');
      return responseData;
    } else {
      throw Exception('Failed to login. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20.0),
                            ),
                        filled: true,
                        fillColor: Color(0xFFDED6FF),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20.0),
                            ),
                        filled: true,
                        fillColor: Color(0xFFDED6FF),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 70),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RotaButton(
                        width: double.infinity,
                        height: 50,
                        text: 'Sign In ',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _saveDataLocally();
                            loginUser(
                              _usernameController.text,
                              _passwordController.text,
                            ).then((result) {
                              print('heyyyyyyyyy');
                              // Handle the result here, e.g., store the token or navigate to the next screen
                              print('Login result: $result');
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Dashboard(), // Navigate to your dashboard screen
                                ),
                              );
                            }).catchError((error) {
                              // Handle the error here, e.g., show an error message
                              print('Login error: $error');
                            });
                          }
                        },
                        color: Colors.black,
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       _formKey.currentState!.save();
                    //       _saveDataLocally();
                    //       loginUser(
                    //         _usernameController.text,
                    //         _passwordController.text,
                    //       ).then((result) {
                    //         print('heyyyyyyyyy');
                    //         // Handle the result here, e.g., store the token or navigate to the next screen
                    //         print('Login result: $result');
                    //         Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) =>
                    //                 Dashboard(), // Navigate to your dashboard screen
                    //           ),
                    //         );
                    //       }).catchError((error) {
                    //         // Handle the error here, e.g., show an error message
                    //         print('Login error: $error');
                    //       });
                    //     }
                    //   },
                    //   child: Text('Login'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
