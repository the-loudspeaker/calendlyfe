import 'package:calendlyfe/network/availablity_service.dart';
import 'package:flutter/material.dart';

import '../components/SlotViewComponent.dart';
import '../model/AvailabilityResponse.dart';

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
      appBar: AppBar(title: const Text("Dhaval"), centerTitle: true),
      body: isLoading
          ? const CircularProgressIndicator()
          : CalendarView(
              availabilityData: availabilityData,
            ),
    );
  }

  Future<void> fetchAvailability() async {
    var apiResponse = await Availability.getAvailability("Dhaval");
    apiResponse.onSuccess((successResponse) {
      setState(() {
        title = successResponse.userName ?? "";
        availabilityData = successResponse.availabilityData ?? [];
        isLoading = false;
      });
      print(successResponse.availabilityData?.first.times?.first.startTime);
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

class CalendarView extends StatelessWidget {
  final List<AvailabilityData> availabilityData;
  const CalendarView({super.key, required this.availabilityData});

  @override
  Widget build(BuildContext context) {
    return availabilityData.isEmpty
        ? const Center(child: Text("No slots available to book"))
        : Center(
          child: SlotViewComponent(availabilityData: availabilityData,),
        );
  }
}
