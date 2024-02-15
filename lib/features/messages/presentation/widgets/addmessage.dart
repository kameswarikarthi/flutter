import 'package:flutter/material.dart';
import '../../data/models/message_list.dart';

import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:message_app/config/theme/quil_editor.dart';

import 'package:intl/intl.dart';
import 'package:message_app/features/messages/presentation/widgets/column.dart';
import 'package:message_app/features/messages/presentation/widgets/styled_text.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/features/messages/presentation/widgets/button.dart';

class AddMessageWidget extends StatefulWidget {
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
  _AddMessageWidgetState createState() => _AddMessageWidgetState();
}

class _AddMessageWidgetState extends State<AddMessageWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final quill.QuillController _controller = quill.QuillController.basic();
  final TextEditingController _publishDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  DateTime? selectedPublishDate;
  DateTime? selectedEndDate;

  @override
  void dispose() {
    _publishDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context,
      TextEditingController controller, DateTime? selectedDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      // Update the selected date and the text field value
      setState(() {
        selectedDate = pickedDate;
        controller.text =
            "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Message'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'ShowIn'),
                items: widget.ShowIn!
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
                items: widget.MessageType!
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
                items: widget.PriorityMessage!
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
              QuilEditor(
                withLabel: true,
                label: "Notification",
                editorController: quill.QuillController.basic(),
              ),
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
                          onPressed: () => _selectDate(context,
                              _publishDateController, selectedPublishDate),
                        ),
                      ),
                      controller: _publishDateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select Publish Date';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'End Date',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(
                              context, _endDateController, selectedEndDate),
                        ),
                      ),
                      controller: _endDateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select End Date';
                        }
                        return null;
                      },
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
}
