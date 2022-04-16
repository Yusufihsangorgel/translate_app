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

class LoadApiEvent extends TranslateEvent {
  final String text;
  final String to;

  const LoadApiEvent(this.text, this.to);
}

class NoInternetEvent extends TranslateEvent {}
