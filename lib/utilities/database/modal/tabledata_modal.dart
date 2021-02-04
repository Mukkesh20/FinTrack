class DropdownTableData {
  String name;
  int invested;
  int value;

  DropdownTableData({this.name, this.invested, this.value});

  factory DropdownTableData.fromMap(Map<String, dynamic> json) =>
      new DropdownTableData(
        name: json["name"],
        invested: json["invested"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "invested": invested,
        "value": value,
      };
}
