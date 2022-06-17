class Report {
  final int temp;
  final String wax;
  final String line;
  final String timeStamp;

  Report(
      {required this.temp,
      required this.wax,
      required this.line,
      required this.timeStamp});

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
        temp: json['temp'],
        wax: json['wax'],
        line: json['line'],
        timeStamp: json['timeStamp']);
  }
}
