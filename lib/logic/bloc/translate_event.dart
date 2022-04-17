part of 'translate_bloc.dart';

@immutable
abstract class TranslateEvent extends Equatable {
  const TranslateEvent();
  @override
  List<Object> get props => [];
}

class TranslateFieldEvent extends TranslateEvent {
  final String message;
  final String to;
  const TranslateFieldEvent(this.message, this.to);
}

class CountryFieldEvent extends TranslateEvent {}

class TranslateButtonEvent extends TranslateEvent {
  //Performanslı olması için yapıyoruz.
  const TranslateButtonEvent();
}

class NoInternetEvent extends TranslateEvent {}
