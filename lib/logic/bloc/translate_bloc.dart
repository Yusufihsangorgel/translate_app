import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:translate_app/models/translate_model.dart';
import 'package:translate_app/services/connectivity_services.dart';
import 'package:translate_app/services/translate_services.dart';

part 'translate_event.dart';
part 'translate_state.dart';

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  final TranslateService _translateService;
  final ConnectivityService _connectivityService;

  TranslateBloc(this._translateService, this._connectivityService)
      : super(TranslateLoadingState()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('no internet');
        add(NoInternetEvent());
      } else {
        print('yes internet');
        add(const TranslateFieldEvent("", ""));
      }
    });

    on<TranslateFieldEvent>((event, emit) async {
      emit(TranslateLoadingState());
      //emit(state.copyWith(message: event.message));

      final translate = await _translateService.getTranslate(
        event.to,
        event.message,
      );
      print(state.message);
      emit(TranslateLoadedState(translate));
    });

    on<NoInternetEvent>((event, emit) {
      emit(TranslateNoInternetState());
    });
  }
}
