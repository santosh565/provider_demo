class Report {
  final int temp;
  final String wax;
  final String line;

  Report({
    required this.temp,
    required this.wax,
    required this.line,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      temp: json['temp'],
      wax: json['wax'],
      line: json['line'],
    );
  }
}
