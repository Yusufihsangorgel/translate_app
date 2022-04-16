part of 'translate_bloc.dart';

@immutable
class TranslateState extends Equatable {
  final String message;
  final String to;

  const TranslateState({this.message = "", this.to = ""});

  @override
  List<Object> get props => [message, to];

  TranslateState copyWith({String? message, String? to}) {
    return TranslateState(
      message: message ?? this.message,
      to: to ?? this.to,
    );
  }
}

class TranslateLoadingState extends TranslateState {}

class TranslateLoadedState extends TranslateState {
  final List<Translate> translate;

  const TranslateLoadedState(this.translate);
}

class TranslateNoInternetState extends TranslateState {}
