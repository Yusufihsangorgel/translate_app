import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translate_app/logic/bloc/translate_bloc.dart';
import 'package:translate_app/logic/utils/extension_media_query.dart';
import 'dart:io' show Platform;
part 'translate_body.dart';

extension on _TranslateBodyState {
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text('Translate App'),
    );
  }

  Widget _image(BuildContext context) {
    const url =
        'https://thumbs.dreamstime.com/b/simple-thin-line-translator-logo-concept-isolated-white-background-vector-illustration-155179164.jpg';
    return Image.network(
      url,
      width: context.width(0.9),
      height: context.height(0.30),
    );
  }

  BlocBuilder<TranslateBloc, TranslateState> get _translateBilgi {
    return BlocBuilder<TranslateBloc, TranslateState>(
      builder: (context, state) {
        if (state is TranslateLoadingState) {
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
                height: context.height(0.2),
                padding: const EdgeInsets.all(8.0),
                child: const Center(
                    child: Text(
                  "...",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                )),
              ),
            ),
          );
        }
        if (state is TranslateLoadedState) {
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
                height: context.height(0.2),
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  state.translate[0].text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15),
                )),
              ),
            ),
          );
        }
        if (state is TranslateNoInternetState) {
          return const Center(child: Text('no internet :('));
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
                height: context.height(0.2),
                padding: const EdgeInsets.all(8.0),
                child: const Center(
                    child: Text(
                  "...",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15),
                )),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _translateField(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 47, right: 47, bottom: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 70.0, horizontal: 20.0),
              labelText: 'İstediğiniz dilde yazabilirsiniz',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onChanged: (newMessage) {
              setState(() {
                message = newMessage;
                context
                    .read<TranslateBloc>()
                    .add(TranslateFieldEvent(message, country));
                print(country);
              });

              print(message + "  textfield");
              print(state.message + "  bloc");
            },
          ),
        );
      },
    );
  }

  Widget _loginButton(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
      builder: (context, state) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                if (Platform.isIOS) {
                  showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: const Text(
                          'Yazdığınız Cümle Aşağıda Seçeceğiniz Dile Çevrilecektir'),
                      content: const Text('Dil Seçiniz'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "tr";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });
                            Navigator.pop(context, 'tr');
                          },
                          child: const Text('Türkçe'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "en";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('İngilizce'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "de";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });

                            Navigator.pop(context, 'de');
                          },
                          child: const Text('Almanca'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "fr";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });
                            Navigator.pop(context, 'fr');
                          },
                          child: const Text('Fransızca'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "ar";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });
                            Navigator.pop(context, 'ar');
                          },
                          child: const Text('Arapça'),
                        ),
                      ],
                    ),
                  );
                } else if (Platform.isAndroid) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text(
                          'Yazdığınız Cümle Aşağıda Seçeceğiniz Dile Çevrilecektir'),
                      content: const Text('Dil Seçiniz'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "tr";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });
                            Navigator.pop(context, 'tr');
                          },
                          child: const Text('Türkçe'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "en";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('İngilizce'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "de";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });

                            Navigator.pop(context, 'de');
                          },
                          child: const Text('Almanca'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "fr";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });
                            Navigator.pop(context, 'fr');
                          },
                          child: const Text('Fransızca'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              country = "ar";
                              context
                                  .read<TranslateBloc>()
                                  .add(TranslateFieldEvent(message, country));
                            });
                            Navigator.pop(context, 'ar');
                          },
                          child: const Text('Arapça'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Çevrilicek Dili Seç'),
            ),
            Text(country == "" ? "Seçili dil : tr" : "Seçili dil : $country",
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          ],
        );
      },
    );
  }
}
