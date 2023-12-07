import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vigenasia/data/datasource/local/auth_local_datasource.dart';
import 'package:vigenasia/main.dart';
import 'package:vigenasia/screen/home_screen.dart';
import 'package:vigenasia/screen/login_screen.dart';
import 'package:vigenasia/screen/register_screen.dart';

abstract class NamedRoute {
  static const home = "/";
  static const register = "/register";
  static const login = "/login";
}

final GoRouter router = GoRouter(
  initialLocation: NamedRoute.login,
  routes: [
    GoRoute(
      path: NamedRoute.home,
      builder: (BuildContext context, GoRouterState state) =>
          const MainScreen(),
      redirect: (context, state) async {
        final isLogin = await AuthLocalDataSource().isLogin();
        if (isLogin) {
          return null;
        } else {
          return NamedRoute.login;
        }
      },
    ),
    GoRoute(
      name: "login",
      path: NamedRoute.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      name: "register",
      path: NamedRoute.register,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
  ],
);
