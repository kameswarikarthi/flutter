part of 'message_bloc.dart';

sealed class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

final class MessageInitial extends MessageState {}

final class MessageSuccss extends MessageState {
  final MessageModel message;
  const MessageSuccss({required this.message});
}

final class MessageFailure extends MessageState {
  final String error;

  const MessageFailure(this.error);
}

final class MessageLoading extends MessageState {}
