import 'package:flutter/material.dart';

class FormHome extends StatefulWidget {
  const FormHome({super.key});

  @override
  State<FormHome> createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length == 1 ||
                    value.trim().length >= 50) {
                  return "Must be between 1 and 50 characters";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your Motivation',
                labelText: 'Input',
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
