import 'package:calendlyfe/model/AvailabilityResponse.dart';
import 'package:result_dart/result_dart.dart';

class Availability {

  static Future<Result<AvailabilityResponse, String>> getAvailability(String username) async {
    var responseData = {
      "userName": "Dhaval",
      "availabilityData": [
        {
          "date": "17 Sep 2024",
          "times": [
            {
              "startTime": 1400,
              "endTime": 1500
            },
            {
              "startTime": 1500,
              "endTime": 1600
            },
            {
              "startTime": 1700,
              "endTime": 1800
            }
          ]
        },
        {
          "date": "18 Sep 2024",
          "times": [
            {
              "startTime": 1300,
              "endTime": 1400
            },
            {
              "startTime": 1500,
              "endTime": 1600
            },
            {
              "startTime": 1700,
              "endTime": 1800
            }
          ]
        }
      ]
    };
    try {
      // throw Exception("HAHAHA");
      return Success(AvailabilityResponse.fromJson(responseData));
    }
   on Exception catch(e) {
      print(e.toString());
      return Failure(e.toString());
   }
  }
}