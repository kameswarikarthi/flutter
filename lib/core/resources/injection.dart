import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:message_app/features/messages/presentation/bloc/message_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  //Blocs
  sl.registerFactory<MessageBloc>(() => MessageBloc());
}
