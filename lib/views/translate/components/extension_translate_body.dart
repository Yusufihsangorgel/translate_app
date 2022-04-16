import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translate_app/logic/bloc/translate_bloc.dart';
import 'package:translate_app/logic/utils/extension_media_query.dart';

part 'translate_body.dart';

extension on TranslateBody {
  AppBar _appBar() {
    return AppBar(
      title: const Text('Login Page'),
    );
  }

  Widget _image(BuildContext context) {
    const url =
        'https://cdn.pixabay.com/photo/2021/06/07/13/46/user-6318008_960_720.png';
    return Image.network(
      url,
      width: context.width(0.9),
      height: context.height(0.35),
    );
  }

  Widget _translateField(BuildContext context) {
    return Container(
      width: context.width(0.8),
      height: context.height(0.09),
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Translate',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onChanged: (message) {
          context.read<TranslateBloc>().add(TranslateFieldEvent(message));
        },
      ),
    );
  }

  BlocBuilder<TranslateBloc, TranslateState> get _translateBilgi {
    return BlocBuilder<TranslateBloc, TranslateState>(
      builder: (context, state) {
        if (state is TranslateLoadedState) {
          return Container(
            width: context.width(0.8),
            height: context.height(0.09),
            padding: const EdgeInsets.all(8.0),
            child: Text(state.text),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: context.width(0.76),
                height: context.height(0.06),
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "anan",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                )),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _loginButton(BuildContext context) => ElevatedButton(
      onPressed: () =>
          BlocProvider.of<TranslateBloc>(context).add(TranslateButtonEvent()),
      child: const Text('Translate'));
}
