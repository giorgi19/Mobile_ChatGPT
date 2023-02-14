import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_chatgpt/app/bloc/app_bloc.dart';
import 'package:mobile_chatgpt/app_ui/app_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppBloc(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      home: const SizedBox(),
    );
  }
}
