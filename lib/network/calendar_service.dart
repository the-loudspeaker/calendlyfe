import 'package:calendlyfe/model/availability_response.dart';
import 'package:result_dart/result_dart.dart';

class CalendarService {
  static Future<Result<AvailabilityResponse, String>> getAvailability(
      String username) async {
    var responseData = {
      "userName": "Dhaval",
      "availabilityData": [
        {
          "date": "2024-09-17",
          "times": [
            {"startTime": 1400, "endTime": 1500},
            {"startTime": 1500, "endTime": 1600},
            {"startTime": 1700, "endTime": 1800}
          ]
        },
        {
          "date": "2024-09-18",
          "times": [
            {"startTime": 1300, "endTime": 1400},
            {"startTime": 1500, "endTime": 1600},
            {"startTime": 1700, "endTime": 1800}
          ]
        }
      ]
    };
    try {
      // throw Exception("HAHAHA");
      await Future.delayed(const Duration(milliseconds: 500));
      return Success(AvailabilityResponse.fromJson(responseData));
    } on Exception catch (e) {
      print(e.toString());
      return Failure(e.toString());
    }
  }

  static Future<Result<String, String>> addEvent(
      String name, String email, String targetUserName) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Success("Event Added");
    } on Exception catch (e) {
      return Failure(e.toString());
    }
  }
}
