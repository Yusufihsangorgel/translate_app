class Translate {
  final String from;
  final String to;
  final String e;
  final List<String> message;

  Translate({
    required this.from,
    required this.to,
    required this.e,
    required this.message,
  });

  factory Translate.fromJson(Map<String, dynamic> json) => Translate(
        from: json["from"],
        to: json["to"],
        e: json["e"],
        message: List<String>.from(json["q"].map((x) => x)),
      );
}
