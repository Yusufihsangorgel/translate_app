import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translate_app/logic/bloc/translate_bloc.dart';
import 'package:translate_app/services/connectivity_services.dart';
import 'package:translate_app/services/translate_services.dart';
import 'package:translate_app/views/translate/components/extension_translate_body.dart';

class TranslateView extends StatelessWidget {
  const TranslateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TranslateBloc(
          RepositoryProvider.of<TranslateService>(context),
          RepositoryProvider.of<ConnectivityService>(context))
        ..add(const TranslateFieldEvent("", "")),
      child: const TranslateBody(),
    );
  }
}
