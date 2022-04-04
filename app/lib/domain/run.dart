class Run {
  int id;
  int duration;
  double distance;
  DateTime start;

  Run(this.id, this.duration, this.distance, this.start);

  factory Run.fromJson(Map<String, dynamic> json) {
    return Run(json["id"], json["duration"], json["distance"], DateTime.parse(json["start"]));
  }

}