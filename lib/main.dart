import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_app/config/app_theme.dart';
import 'package:property_app/pages/base_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          textTheme: GoogleFonts.outfitTextTheme(),
          scaffoldBackgroundColor: AppColor.bg,
        ),
        home: BasePage(),
    );
  }
}