import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/features/messages/presentation/bloc/message_bloc.dart';
import 'package:message_app/features/messages/presentation/widgets/addmessage.dart';
import '../../data/models/message_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:message_app/config/theme/app_themes.dart';
import 'package:message_app/core/resources/injection.dart';

class AddMessagePage extends StatelessWidget {
  const AddMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the UI to display message details based on the data
    return BlocProvider<MessageBloc>(
      create: (context) => sl()..add(OnMessageTypeLoaded()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: BlocBuilder<MessageBloc, MessageState>(
          builder: (_, state) {
            if (state is MessageLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state is MessageFailure) {
              print(state.error);
              return const Center(child: Icon(Icons.refresh));
            }

            if (state is MessageTypeSuccss) {
              final List<MessageTypeData>? MessageType =
                  state.messageType.data?.messageTypeData;
              final List<PriorityMessageData>? PriorityMessage =
                  state.messageType.data?.priorityMessageData;
              final List<ShowInDatas>? ShowIn =
                  state.messageType.data?.showInDatas;
              return Container(
                color: const Color.fromARGB(
                    255, 233, 230, 230), // Set background color to grey
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Set border radius
                  child: AddMessageWidget(
                    MessageType: MessageType,
                    PriorityMessage: PriorityMessage,
                    ShowIn: ShowIn,
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
