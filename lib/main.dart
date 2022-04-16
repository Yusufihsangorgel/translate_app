import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translate_app/Screens/translate_screen.dart';
import 'package:translate_app/bloc/translate_bloc.dart';
import 'package:translate_app/models/translate_model.dart';
import 'package:translate_app/services/connectivity_services.dart';
import 'package:translate_app/services/translate_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => TranslateService(),
        ),
        RepositoryProvider(
          create: (context) => ConnectivityService(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TranslateBloc>(
            create: (context) => TranslateBloc(
              RepositoryProvider.of<TranslateService>(context),
              RepositoryProvider.of<ConnectivityService>(context),
            )..add(LoadApiEvent("", "")),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TranslateScreen(),
        ),
      ),
    );
  }
}
