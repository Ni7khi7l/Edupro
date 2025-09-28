class Attendance {
  String? title;
  int? todaysDate;
  String? contains;

  Attendance({this.title, this.todaysDate, this.contains});

  Attendance.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    todaysDate = json['todaysDate'];
    contains = json['contains'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['todaysDate'] = todaysDate;
    data['contains'] = contains;

    return data;
  }
}
