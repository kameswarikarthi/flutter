import 'package:flutter/material.dart';
import '../../data/models/message_list.dart';
//import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:intl/intl.dart';
import 'package:message_app/features/messages/presentation/widgets/column.dart';
import 'package:message_app/features/messages/presentation/widgets/styled_text.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/features/messages/presentation/widgets/button.dart';

class AddMessageWidget extends StatelessWidget {
  final List<MessageTypeData>? MessageType;
  final List<PriorityMessageData>? PriorityMessage;
  final List<ShowInDatas>? ShowIn;
  final Function(DateTime?) onDateSelected; // Callback function
  final DateTime? selectedDate;

  const AddMessageWidget({
    Key? key,
    required this.MessageType,
    required this.PriorityMessage,
    required this.ShowIn,
    required this.onDateSelected, // Callback function for date selection
    required this.selectedDate, // Selected date passed from the parent widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // final quill.QuillController _controller = quill.QuillController.basic();

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
                    .map((showInData) => DropdownMenuItem<String>(
                          value: showInData.showInName,
                          child: Text(showInData.showInName.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Handle project dropdown value change
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select ShowIn';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Type'),
                items: MessageType!
                    .map((messageTypeData) => DropdownMenuItem<String>(
                          value: messageTypeData.messageTypeName,
                          child:
                              Text(messageTypeData.messageTypeName.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Handle type dropdown value change
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select Type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Message Priority'),
                items: PriorityMessage!
                    .map((priorityMessageData) => DropdownMenuItem<String>(
                          value: priorityMessageData.priorityMessageName,
                          child: Text(priorityMessageData.priorityMessageName
                              .toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Handle participant type dropdown value change
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select Message Priority';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // quill.QuillEditor(
              //   controller: _controller,
              //   scrollController: ScrollController(),
              //   padding: EdgeInsets.zero,
              //   scrollable: true,
              //   expands: false,
              //   focusNode: FocusNode(),
              //   autoFocus: false,
              //   readOnly: false,
              //   placeholder: 'Enter your message...',
              // ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Publish Date',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                      controller: TextEditingController(
                        text: selectedDate != null
                            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                            : '',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    onDateSelected(
        pickedDate); // Update the selected date using the callback function
  }
}
