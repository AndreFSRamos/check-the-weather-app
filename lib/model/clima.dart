class Clima {
  final String city;
  final String description;
  final int temp;
  final String descriptionCode;
  final String currently;
  final String date;

  Clima(this.city, this.description, this.temp, this.currently,
      this.descriptionCode, this.date);

  factory Clima.fromJson(Map<String, dynamic> json) {
    return Clima(
      json["results"]["city"],
      json["results"]['description'],
      json["results"]["temp"],
      json["results"]["currently"],
      json["results"]["condition_code"],
      json["results"]["date"],
    );
  }

  Map<String, dynamic> toJson() => {
        "city": city,
        "description": description,
        "temp": temp,
        "currently": currently,
        "condition_code": descriptionCode,
        "date": date
      };
}