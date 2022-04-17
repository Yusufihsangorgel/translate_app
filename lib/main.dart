import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translate_app/logic/bloc/translate_bloc.dart';
import 'package:translate_app/router/app_router.dart';
import 'package:translate_app/services/connectivity_services.dart';
import 'package:translate_app/services/translate_services.dart';
import 'package:translate_app/views/translate/components/translate_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

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
            )..add(const TranslateFieldEvent("", "")),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const TranslateView(),
          onGenerateRoute: _appRouter.RouteChanger,
        ),
      ),
    );
  }
}
