import 'package:flutter/material.dart';
import 'package:reg_rota_pad/registeration.dart';
import 'package:reg_rota_pad/widgets/reg_rota_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;

    setState(() {
      isLoggedIn = loggedIn;
    });

    if (loggedIn) {
      // User is logged in, navigate to the home screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Dashboard(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset('assets/images/pix.png'),
              Text(
                'Transform your team   ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'scheduling and productivity',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Increase productivity with a simple to-do '),
              Text(' app for managing your business activities '),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: RotaButton(
                  width: double.infinity,
                  text: 'Get Started',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegisterationForm(),
                      ),
                    );
                    // vendorLoginController.vendorLoginUser(
                    //   email: _emailController.text,
                    //   password: _passwordController.text,
                    // );
                    // Get.to(VendorHomeScreen());
                  },
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
