import 'package:flutter/material.dart';
import 'package:message_app/features/messages/presentation/widgets/styled_text.dart';
import 'package:message_app/core/constants/constants.dart';
import '../../data/models/message.dart';
import 'package:intl/intl.dart';
import 'package:message_app/features/messages/presentation/pages/message_details.dart';

List<DataColumn> buildDataColumns(List<String> columnHeaders) {
  return columnHeaders.map((header) {
    return DataColumn(
      label: styledText(
        header,
        fontName: headingFont, // Change to your desired font name
        fontSize: 13, // Change to your desired font size
        alignment: TextAlign.left, // Change to your desired alignment
      ),
    );
  }).toList();
}

List<DataRow> buildDataRows(BuildContext context, List<ListData>? listData) {
  return listData?.map((data) {
        return DataRow(
          cells: [
            DataCell(
              Text('${data.messageId ?? ""}'),
            ),
            DataCell(
              SizedBox(
                height: 40, // Set the initial height
                child: Text(
                  '${data.messageText ?? ""}',
                  maxLines:
                      2, // Set the maximum number of lines to prevent overflow
                  overflow: TextOverflow.ellipsis, // Handle overflow text
                ),
              ),
            ),
            DataCell(
              Text(
                  '${data.project?.isNotEmpty ?? false ? data.project![0].projectId ?? "" : ""}'),
            ),
            DataCell(
              Text('${data.messageType?.messageTypeName ?? ""}'),
            ),
            DataCell(
              Text(
                '${data.messageParticipantType?.isNotEmpty ?? false ? data.messageParticipantType!.map((participant) => participant.role?.roleName ?? "").join(", ") : ""}',
              ),
            ),
            DataCell(
              Text(
                '${data.publishDate != null ? DateFormat(defaultDateFormat).format(DateTime.parse(data.publishDate!)) : ""}',
              ),
            ),
            DataCell(
              Text(
                '${data.updatedAt != null ? DateFormat(defaultDateFormat).format(DateTime.parse(data.updatedAt!)) : ""}',
              ),
            ),
            DataCell(
              Text(
                '${data.endDate != null ? DateFormat(defaultDateFormat).format(DateTime.parse(data.endDate!)) : ""}',
              ),
            ),
            DataCell(
              Text(data.messageStatus?.messageStatusName ?? ""),
            ),
            DataCell(
              MouseRegion(
                cursor: SystemMouseCursors
                    .click, // Change cursor to hand when mouse hovers over
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MessageDetailsPage(data: data),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.visibility,
                    size: 24, // Set the size of the icon
                    color: Colors.blue, // Set the color of the icon
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList() ??
      [];
}

Widget buildDetailItem(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8),
      Text(
        value,
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 20),
    ],
  );
}
