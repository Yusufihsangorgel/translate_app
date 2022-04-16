part of 'translate_bloc.dart';

@immutable
abstract class TranslateState extends Equatable {
  final String message;
  final String to;

  const TranslateState({this.message = "", this.to = ""});

  @override
  List<Object> get props => [message, to];

  TranslateState copyWith({String? message, String? to}) {
    return TranslateLoadingState(
      message: message ?? this.message,
      to: to ?? this.to,
    );
  }
}

class TranslateLoadingState extends TranslateState {
  final String message;
  final String to;

  const TranslateLoadingState({this.message = '', this.to = ''});
}

class TranslateLoadedState extends TranslateState {
  final String text;

  const TranslateLoadedState(this.text);
}

class TranslateNoInternetState extends TranslateState {}
