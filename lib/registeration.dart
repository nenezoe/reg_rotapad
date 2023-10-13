import 'package:flutter/material.dart';
import 'package:reg_rota_pad/login.dart';
import 'package:reg_rota_pad/widgets/reg_rota_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterationForm extends StatefulWidget {
  @override
  _RegisterationFormState createState() => _RegisterationFormState();
}

class _RegisterationFormState extends State<RegisterationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _urlController = TextEditingController();

  void _saveDataLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('first_name', _firstNameController.text);
    await prefs.setString('last_name', _lastNameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('url', _urlController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Color.fromARGB(214, 238, 236, 236),
          // title: Text('Flutter Form Example'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 10,
              // ),
              // Icon(Icons.arrow_back),
              const Text(
                'Register',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                          labelText: 'Enter First Name',
                          border: OutlineInputBorder(
                              // Add border
                              // borderRadius: BorderRadius.circular(
                              //     20.0), // Customize border radius
                              ),
                          filled: true, // Fill the background with color
                          fillColor: Color(0xffded6ff)
                          // fillColor: Colors.grey[200], // Set the background color
                          ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                          labelText: 'Enter Last Name',
                          border: OutlineInputBorder(
                              // Add border
                              // borderRadius: BorderRadius.circular(
                              //     20.0), // Customize border radius
                              ),
                          filled: true, // Fill the background with color
                          fillColor: Color(0xffded6ff)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(
                              // Add border
                              // borderRadius: BorderRadius.circular(
                              //     20.0), // Customize border radius
                              ),
                          filled: true, // Fill the background with color
                          fillColor: Color(0xffded6ff)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _urlController,
                      decoration: InputDecoration(
                          labelText: 'Enter Company URL',
                          border: OutlineInputBorder(
                              // Add border
                              // borderRadius: BorderRadius.circular(
                              //     20.0), // Customize border radius
                              ),
                          filled: true, // Fill the background with color
                          fillColor: Color(0xffded6ff)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a URL';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RotaButton(
                        width: double.infinity,
                        height: 50,
                        text: 'Register ',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _saveDataLocally();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Data saved locally')),
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          }

                          // vendorLoginController.vendorLoginUser(
                          //   email: _emailController.text,
                          //   password: _passwordController.text,
                          // );
                          // Get.to(VendorHomeScreen());
                        },
                        color: Colors.black,
                        // color: Color(0xffc07cfc).withOpacity(0.9),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       _formKey.currentState!.save();
                    //       _saveDataLocally();
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(content: Text('Data saved locally')),
                    //       );
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (context) => LoginScreen(),
                    //         ),
                    //       );
                    //     }
                    //   },
                    //   child: Text('Submit'),
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
