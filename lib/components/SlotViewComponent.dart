import 'package:calendar_view/calendar_view.dart';
import 'package:calendlyfe/model/AvailabilityResponse.dart';
import 'package:flutter/material.dart';

DateTime get _now => DateTime.now();

class SlotViewComponent extends StatefulWidget {
  final List<AvailabilityData> availabilityData;
  const SlotViewComponent({super.key, required this.availabilityData});

  @override
  State<SlotViewComponent> createState() => _SlotViewComponentState();
}

class _SlotViewComponentState extends State<SlotViewComponent> {
  List<CalendarEventData> eventsList = [CalendarEventData(
  date: _now,
  title: "Project meeting",
  description: "Today is project meeting.",
  startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
  endTime: DateTime(_now.year, _now.month, _now.day, 22),
  )];
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll(eventsList),
      child: const DayView(),
    );
  }
}
