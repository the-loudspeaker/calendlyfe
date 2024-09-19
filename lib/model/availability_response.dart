class AvailabilityResponse {
  String? userName;
  List<AvailabilityData>? availabilityData;

  AvailabilityResponse({this.userName, this.availabilityData});

  AvailabilityResponse.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    if (json['availabilityData'] != null) {
      availabilityData = <AvailabilityData>[];
      json['availabilityData'].forEach((v) {
        availabilityData!.add(AvailabilityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    if (availabilityData != null) {
      data['availabilityData'] =
          availabilityData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailabilityData {
  DateTime? date;
  List<Times>? times;

  AvailabilityData({this.date, this.times});

  AvailabilityData.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    if (json['times'] != null) {
      times = <Times>[];
      json['times'].forEach((v) {
        times!.add(Times.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (times != null) {
      data['times'] = times!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<AvailabilityData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AvailabilityData.fromJson(map)).toList();
  }
}

class Times {
  int? startHour;
  int? startMin;
  int? endHour;
  int? endMin;

  Times({this.startHour, this.startMin, this.endHour, this.endMin});

  Times.fromJson(Map<String, dynamic> json) {
    startHour = json['startTime'] ~/ 100;
    startMin = json['startTime'] % 100;
    endHour = json['endTime'] ~/ 100;
    endMin = json['endTime'] % 100;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startTime'] = startHour! * 100 + startMin!;
    data['endTime'] = endHour! * 100 + endMin!;
    return data;
  }
}
