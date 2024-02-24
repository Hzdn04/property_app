import 'package:flutter/material.dart';
import 'package:property_app/config/app_theme.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/notorder.png',
          width: 320,
          height: 200,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Page Not Found',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.secondary),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    ));
  }
}
