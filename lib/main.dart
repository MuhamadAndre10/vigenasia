import 'package:flutter/material.dart';
import 'package:vigenasia/bloc/login/login_bloc.dart';
import 'package:vigenasia/bloc/motivation/motivation_bloc.dart';
import 'package:vigenasia/bloc/register/register_bloc.dart';
import 'package:vigenasia/data/datasource/remote/auth_datasource.dart';
import 'package:vigenasia/data/datasource/remote/motivation_datasource.dart';
import 'package:vigenasia/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  return runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthDataSource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDataSource()),
        ),
        BlocProvider(
          create: (context) => MotivationBloc(
            MotivationDatasource(),
          ),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: "Vigenasia",
      ),
    );
  }
}
