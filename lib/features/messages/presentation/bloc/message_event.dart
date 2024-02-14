part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

final class OnMessageLoaded extends MessageEvent {}

final class OnMessageTypeLoaded extends MessageEvent {}
