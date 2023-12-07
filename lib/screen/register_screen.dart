import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vigenasia/bloc/register/register_bloc.dart';
import 'package:vigenasia/router.dart';
import 'package:vigenasia/screen/login_screen.dart';

import '../data/model/request/register_request_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController? _nameController;
  TextEditingController? _professionController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _professionController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController!.dispose();
    _professionController!.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Screen Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register Your Account",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                ),
                const SizedBox(height: 32),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Nama"),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _professionController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Profesi"),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Email"),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Password"),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text("Reset"),
                          ),
                          const SizedBox(width: 12),
                          BlocConsumer<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              if (state is RegisterLoading) {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }

                              return ElevatedButton(
                                onPressed: () {
                                  context.read<RegisterBloc>().add(
                                        DoRegister(
                                          model: RegisterRequestModel(
                                            email: _emailController!.text,
                                            name: _nameController!.text,
                                            profesi:
                                                _professionController!.text,
                                            password: _passwordController!.text,
                                          ),
                                        ),
                                      );
                                },
                                child: const Text("Register"),
                              );
                            },
                            listener: (context, state) {
                              if (state is RegisterSuccess) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.model.message),
                                  ),
                                );
                              }

                              if (state is RegisterError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            context.replace(NamedRoute.login);
                          },
                          child: const Text("Sudah punya akun?")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
