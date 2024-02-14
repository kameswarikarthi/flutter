import 'package:flutter/material.dart';
import '../../data/models/message.dart'; // Import the message data model
import 'package:intl/intl.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/features/messages/presentation/widgets/column.dart';

class MessageDetailsPage extends StatelessWidget {
  final ListData data; // Accept the data object here

  const MessageDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the UI to display message details based on the data
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDetailItem('Message ID:', data.messageId.toString()),
            buildDetailItem('Summary:', data.messageText.toString()),
            buildDetailItem(
              'Project ID:',
              data.project?.isNotEmpty ?? false
                  ? data.project![0].projectId
                      .toString() // Ensure projectId is a String
                  : "",
            ),
            buildDetailItem('Type:', data.messageType?.messageTypeName ?? ""),
            buildDetailItem(
              'Participant Type:',
              data.messageParticipantType?.isNotEmpty ?? false
                  ? data.messageParticipantType!
                      .map((participant) => participant.role?.roleName ?? "")
                      .join(", ")
                  : "",
            ),
            buildDetailItem(
              'Published Date:',
              data.publishDate != null
                  ? DateFormat(defaultDateFormat)
                      .format(DateTime.parse(data.publishDate!))
                  : "",
            ),
            buildDetailItem(
              'Updated Date:',
              data.updatedAt != null
                  ? DateFormat(defaultDateFormat)
                      .format(DateTime.parse(data.updatedAt!))
                  : "",
            ),
            buildDetailItem(
              'End Date:',
              data.endDate != null
                  ? DateFormat(defaultDateFormat)
                      .format(DateTime.parse(data.endDate!))
                  : "",
            ),
            buildDetailItem(
              'Status:',
              data.messageStatus?.messageStatusName ?? "",
            ),
          ],
        ),
      ),
    );
  }
}
