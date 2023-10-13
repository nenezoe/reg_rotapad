import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reg_rota_pad/onboarding_screen.dart';
import 'package:reg_rota_pad/registeration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.poppins(),
        ),
        useMaterial3: true,
      ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      // home: RegisterationForm(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
