class History {
  late String name;
  late String segment;

    History({
    required this.name,
    required this.segment,
  });

  History.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    segment = json['segment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['segment'] = this.segment;
    return data;
  }
  toLowerCase() {}
}