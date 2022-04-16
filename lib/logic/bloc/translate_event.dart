part of 'translate_bloc.dart';

@immutable
abstract class TranslateEvent extends Equatable {
  const TranslateEvent();
  @override
  List<Object> get props => [];
}

// class RequestEvent extends TranslateEvent {
//   final String text;
//   final String to;

//   const RequestEvent(this.text, this.to);
// }

// class LoadApiEvent extends TranslateEvent {
//   final String text;
//   final String to;

//   const LoadApiEvent(this.text, this.to);
// }

class TranslateFieldEvent extends TranslateEvent {
  final String message;
  const TranslateFieldEvent(this.message);
}

class CountryFieldEvent extends TranslateEvent {
  final String to;

  const CountryFieldEvent(this.to);
}

class TranslateButtonEvent extends TranslateEvent {
  //Performanslı olması için yapıyoruz.
  const TranslateButtonEvent();
}

class NoInternetEvent extends TranslateEvent {}
