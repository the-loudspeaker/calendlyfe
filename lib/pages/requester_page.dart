import 'package:calendar_view/calendar_view.dart';
import 'package:calendlyfe/components/calendar_view.dart';
import 'package:calendlyfe/components/event_form.dart';
import 'package:calendlyfe/model/availability_response.dart';
import 'package:calendlyfe/network/calendar_service.dart';
import 'package:flutter/material.dart';

class RequesterPage extends StatefulWidget {
  const RequesterPage({super.key});

  @override
  State<RequesterPage> createState() => _RequesterPageState();
}

class _RequesterPageState extends State<RequesterPage> {
  late String title;
  late List<AvailabilityData> availabilityData;
  bool isLoading = true;

  @override
  void initState() {
    fetchAvailability();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLoading ? "" : title), centerTitle: true),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : CalendarView(
              availabilityData: availabilityData,
              tapCallback: showEventForm,
            ),
    );
  }

  void showEventForm(List<CalendarEventData> events, DateTime date) {
    var e = events.first;
    showAdaptiveDialog(
        context: context,
        builder: (context) {
          return EventForm(
            event: e,
            onAddButtonClick: addButtonClick,
          );
        });
  }

  Future<void> addButtonClick(String name, String email) async {
    var apiResponse = await CalendarService.addEvent(name, email, title);
    apiResponse.onSuccess((success) {
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(success)));
      fetchAvailability();
    });
    apiResponse.onFailure((failure) {
      Navigator.pop(context, true);
    });
  }

  Future<void> fetchAvailability() async {
    var apiResponse = await CalendarService.getAvailability("Dhaval");
    apiResponse.onSuccess((successResponse) {
      setState(() {
        title = successResponse.userName ?? "";
        availabilityData = successResponse.availabilityData ?? [];
        isLoading = false;
      });
    });
    apiResponse.onFailure((failure) {
      setState(() {
        title = "";
        availabilityData = [];
        isLoading = false;
      });
    });
  }
}
