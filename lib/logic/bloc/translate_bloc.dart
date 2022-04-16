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
  // TranslateBloc() : super(const TranslateState()) {
  //   final _translateService = TranslateService();

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
        add(TranslateButtonEvent());
      }
    });

    on<TranslateFieldEvent>((event, emit) async {
      emit(TranslateLoadingState());
      emit(state.copyWith(message: event.message));
      final anan = await _translateService.getTranslate(
        state.to,
        state.message,
      );
      print(state.message);
      emit(TranslateLoadedState(anan));
    });

    on<CountryFieldEvent>((event, emit) => emit(state.copyWith(to: event.to)));

    on<TranslateButtonEvent>((event, emit) async {
      final anan = await _translateService.getTranslate(
        state.to,
        state.message,
      );
      emit(TranslateLoadedState(anan));
    });

    on<NoInternetEvent>((event, emit) {
      emit(TranslateNoInternetState());
    });
  }
}
