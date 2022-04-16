part of 'translate_bloc.dart';

@immutable
abstract class TranslateState extends Equatable {
  const TranslateState();
}

class TranslateLoadingState extends TranslateState {
  final String message;
  final String to;

  const TranslateLoadingState({this.message = '', this.to = ''});

  @override
  List<Object> get props => [message, to];

  TranslateLoadingState copyWith({String? message, String? to}) {
    return TranslateLoadingState(
      message: message ?? this.message,
      to: to ?? this.to,
    );
  }
}

class TranslateRequestState extends TranslateState {
  @override
  List<Object> get props => [];
}

class TranslateLoadedState extends TranslateState {
  final String text;

  const TranslateLoadedState(this.text);

  @override
  List<Object?> get props => [text];
}

class TranslateNoInternetState extends TranslateState {
  @override
  List<Object?> get props => [];
}
