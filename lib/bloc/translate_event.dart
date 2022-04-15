part of 'translate_bloc.dart';

@immutable
abstract class TranslateEvent extends Equatable {
  const TranslateEvent();
}

class LoadApiEvent extends TranslateEvent {
  @override
  List<Object?> get props => [];
}

class NoInternetEvent extends TranslateEvent {
  @override
  List<Object> get props => [];
}
