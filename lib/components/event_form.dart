import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  final CalendarEventData<Object?> event;
  final Function(String name, String email) onAddButtonClick;
  const EventForm(
      {super.key, required this.event, required this.onAddButtonClick});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  String email = "";
  String name = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
    nameController.addListener(() {
      setState(() {
        name = nameController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Schedule a new meeting"),
          const Divider(),
          Text(
              "date: ${widget.event.date.day}/${widget.event.date.month}/${widget.event.date.year}"),
          Text(
              "starts at: ${widget.event.startTime!.hour.appendLeadingZero()}:${widget.event.startTime!.minute.appendLeadingZero()}"),
          Text(
              "ends at: ${widget.event.endTime!.hour.appendLeadingZero()}:${widget.event.endTime!.minute.appendLeadingZero()}"),
          const Divider(),
          const Text("Enter name:"),
          TextField(
              autofocus: true,
              controller: nameController,
              keyboardType: TextInputType.name),
          const Text("Enter email:"),
          TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress)
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            onPressed: (name.isNotEmpty && email.isNotEmpty)
                ? () => widget.onAddButtonClick(name, email)
                : null,
            child: const Text("Add event"))
      ],
    );
  }
}
