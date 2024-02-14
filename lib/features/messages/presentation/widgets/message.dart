import 'package:flutter/material.dart';
import '../../data/models/message.dart';
import 'package:intl/intl.dart';
import 'package:message_app/features/messages/presentation/widgets/column.dart';
import 'package:message_app/features/messages/presentation/widgets/styled_text.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/features/messages/presentation/widgets/button.dart';

class MessageWidget extends StatelessWidget {
  final List<ListData>? listData;
  const MessageWidget({
    Key? key,
    required this.listData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            const AddButton(),
            const SizedBox(height: 30),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  child: DataTable(
                    border: TableBorder.symmetric(),
                    columnSpacing: 30,
                    columns: buildDataColumns([
                      'ID',
                      'Summary',
                      'Project Id',
                      'Type',
                      'Participant Type',
                      'Published Date',
                      'Updated Date',
                      'End Date',
                      'Status',
                      'Action',
                    ]),
                    rows: buildDataRows(context, listData),
                    showBottomBorder: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
