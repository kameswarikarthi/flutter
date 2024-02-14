import 'package:flutter/material.dart';
import '../../data/models/message.dart'; // Import the message data model
import 'package:intl/intl.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/features/messages/presentation/widgets/column.dart';

class AddMessagePage extends StatelessWidget {
  const AddMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the UI to display message details based on the data
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
