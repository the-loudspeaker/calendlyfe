import 'package:calendar_view/calendar_view.dart';
import 'package:calendlyfe/model/availability_response.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  final List<AvailabilityData> availabilityData;
  final CellTapCallback tapCallback;
  const CalendarView(
      {super.key, required this.availabilityData, required this.tapCallback});

  @override
  Widget build(BuildContext context) {
    final eventsList = availabilityData
        .expand((e) => (e.times ?? []).map((f) => CalendarEventData(
              title: "available",
              titleStyle: const TextStyle(fontSize: 10),
              date: e.date!,
              startTime: DateTime(e.date!.year, e.date!.month, e.date!.day,
                  f.startHour!, f.startMin!),
              endTime: DateTime(e.date!.year, e.date!.month, e.date!.day,
                  f.endHour!, f.endMin!),
              color: Colors.lightGreen,
            )))
        .toList();
    return Center(
        child: availabilityData.isEmpty
            ? const Text("No slots available to book")
            : CalendarControllerProvider(
                controller: EventController()..addAll(eventsList),
                child: WeekView(
                  keepScrollOffset: true,
                  onEventTap: tapCallback,
                ),
              ));
  }
}
