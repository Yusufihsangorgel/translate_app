part of 'translate_bloc.dart';

@immutable
abstract class TranslateState extends Equatable {
  const TranslateState();
}

class TranslateRequestState extends TranslateState {
  final String text;
  final String from;
  final String to;

  const TranslateRequestState(this.text, this.from, this.to);

  @override
  List<Object> get props => [text, from, to];
}

class TranslateLoadingState extends TranslateState {
  @override
  List<Object> get props => [];
}

class TranslateLoadedState extends TranslateState {
  final String translate;

  const TranslateLoadedState(this.translate);

  @override
  List<Object?> get props => [translate];
}

class TranslateNoInternetState extends TranslateState {
  @override
  List<Object?> get props => [];
}
