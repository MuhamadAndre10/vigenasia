import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vigenasia/bloc/login/login_bloc.dart';
import 'package:vigenasia/data/datasource/local/auth_local_datasource.dart';
import 'package:vigenasia/data/model/request/logn_request_model.dart';
import 'package:vigenasia/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  bool isPasswordVisible = false;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Screen Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Your Account",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                ),
                const SizedBox(height: 32),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Your Email"),
                        // email validator
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains("@")) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Your Password",
                        ),
                        validator: (value) {
                          if (value == null || value.trim().length < 6) {
                            return 'Password must be at least 6 characters long';
                          }

                          return null;
                        },
                        onSaved: (value) {},
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
                          BlocConsumer<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  final model = LoginRequestModel(
                                    email: _emailController!.text,
                                    password: _passwordController!.text,
                                  );
                                  context
                                      .read<LoginBloc>()
                                      .add(DoLogin(model: model));
                                },
                                child: const Text("Login"),
                              );
                            },
                            listener: (context, state) async {
                              if (state is LoginError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                  ),
                                );
                              } else if (state is LoginSuccess) {
                                await AuthLocalDataSource()
                                    .saveAuthData(state.model);

                                context.go(NamedRoute.home);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Login Success'),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            context.go(NamedRoute.register);
                          },
                          child: const Text("Belum punya akun?")),
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
