import 'package:flutter/material.dart';
import 'package:message_app/features/messages/presentation/pages/addmessage.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors
          .click, // Change cursor to hand when mouse hovers over
      child: GestureDetector(
        onTap: () {
          // Navigate to the desired route here
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddMessagePage(),
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue, // Button background color
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.white), // + icon
                      SizedBox(width: 5), // Spacing between icon and text
                      Text("Add Message",
                          style: TextStyle(color: Colors.white)),
                    ],
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
