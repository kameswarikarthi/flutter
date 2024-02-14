import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:message_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:message_app/features/messages/data/repository/message_repository_impl.dart';
import 'package:message_app/features/messages/data/models/message.dart';
import 'package:message_app/features/messages/data/models/message_list.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessageInitial()) {
    on<OnMessageLoaded>(_OnMessageLoaded);
    on<OnMessageTypeLoaded>(_OnMessageTypeLoaded);
  }
}

void _OnMessageLoaded(OnMessageLoaded event, Emitter<MessageState> emit) async {
  emit(MessageLoading());
  try {
    final _authRepository = AuthRepositoryImpl();
    final _messageRepository = MessageRepositoryImpl();
    final token = await _authRepository.getToken();
    final respo = await _messageRepository.getMessages();
    final list = MessageModel.fromJson(respo?.data);

    if (token == null || token == '') {
      return emit(const MessageFailure("Invalid Token"));
    }
    await Future.delayed(const Duration(seconds: 1), () {
      return emit(MessageSuccss(message: list));
    });
  } catch (e) {
    return emit(MessageFailure(e.toString()));
  }
}

void _OnMessageTypeLoaded(
    OnMessageTypeLoaded event, Emitter<MessageState> emit) async {
  emit(MessageLoading());
  try {
    final _authRepository = AuthRepositoryImpl();
    final _messageRepository = MessageRepositoryImpl();
    final token = await _authRepository.getToken();
    final respo = await _messageRepository.getMessageList();
    final resultData = MessageListModel.fromJson(respo?.data);

    if (token == null || token == '') {
      return emit(const MessageFailure("Invalid Token"));
    }
    await Future.delayed(const Duration(seconds: 1), () {
      return emit(MessageTypeSuccss(messageType: resultData));
    });
  } catch (e) {
    return emit(MessageFailure(e.toString()));
  }
}
