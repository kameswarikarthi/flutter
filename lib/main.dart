import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message_app/core/resources/bloc_observer.dart';
import 'package:message_app/features/messages/presentation/bloc/message_bloc.dart';
import 'config/theme/app_themes.dart';
import 'package:message_app/features/messages/presentation/pages/listmessage.dart';
import 'core/resources/injection.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MessageBloc>(
      create: (context) => sl()..add(OnMessageLoaded()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const ListMessage(),
      ),
    );
  }
}
