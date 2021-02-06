class DropdownTableData {
  int id;
  String cardName;
  String name;
  int invested;
  int value;

  DropdownTableData(
      {this.id, this.cardName, this.name, this.invested, this.value});

  factory DropdownTableData.fromMap(Map<String, dynamic> json) =>
      new DropdownTableData(
        id: json["id"],
        cardName: json["cardName"],
        name: json["name"],
        invested: json["invested"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cardName": cardName,
        "name": name,
        "invested": invested,
        "value": value,
      };
}
