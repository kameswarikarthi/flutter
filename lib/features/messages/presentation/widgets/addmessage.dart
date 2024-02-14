import 'package:flutter/material.dart';
import '../../data/models/message_list.dart';
import 'package:intl/intl.dart';
import 'package:message_app/features/messages/presentation/widgets/column.dart';
import 'package:message_app/features/messages/presentation/widgets/styled_text.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/features/messages/presentation/widgets/button.dart';

class AddMessageWidget extends StatelessWidget {
  final List<MessageTypeData>? MessageType;
  final List<PriorityMessageData>? PriorityMessage;
  final List<ShowInDatas>? ShowIn;
  const AddMessageWidget({
    Key? key,
    required this.MessageType,
    required this.PriorityMessage,
    required this.ShowIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'ShowIn'),
                items: ShowIn!
                    .map((project) => DropdownMenuItem<String>(
                          value: project.showInName,
                          child: Text(project.showInName.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Handle project dropdown value change
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Type'),
                items: MessageType!
                    .map((project) => DropdownMenuItem<String>(
                          value: project.messageTypeName,
                          child: Text(project.messageTypeName.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Handle type dropdown value change
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Message Priority'),
                items: PriorityMessage!
                    .map((project) => DropdownMenuItem<String>(
                          value: project.priorityMessageName,
                          child: Text(project.priorityMessageName.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Handle participant type dropdown value change
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Show date picker
                },
                child: Text('Select Publish Date'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save form data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form saved')),
                    );
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
