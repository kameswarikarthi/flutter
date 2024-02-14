import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message_app/features/messages/presentation/bloc/message_bloc.dart';
import 'package:message_app/features/messages/presentation/widgets/message.dart';
import '../../data/models/message.dart';

class ListMessage extends StatelessWidget {
  const ListMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'List Messages',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<MessageBloc, MessageState>(
      builder: (_, state) {
        if (state is MessageLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is MessageFailure) {
          print(state.error);
          return const Center(child: Icon(Icons.refresh));
        }

        if (state is MessageSuccss) {
          final List<ListData>? listData = state.message.data?.listData;
          return Container(
            color: const Color.fromARGB(
                255, 233, 230, 230), // Set background color to grey
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50), // Set border radius
              child: MessageWidget(
                listData: listData,
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
