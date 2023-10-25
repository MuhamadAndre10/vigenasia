import 'package:flutter/material.dart';
import 'package:vigenasia/widget/form_home.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Screen"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MOTIVASI",
                style: TextStyle(
                    color: Color.fromARGB(255, 224, 104, 96),
                    fontSize: 48,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Visi Generasi Indonesia",
                style: TextStyle(
                    color: Color.fromARGB(255, 224, 104, 96),
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              FormHome()
            ],
          ),
        ),
      ),
    );
  }
}
