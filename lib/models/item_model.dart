import 'dart:convert';

ItemsResponse itemsResponseFromJson(String str) =>
    ItemsResponse.fromJson(json.decode(str));

String itemsResponseToJson(ItemsResponse data) => json.encode(data.toJson());

class ItemsResponse {
  ItemsResponse(
      {required this.name,
      required this.description,
      required this.priceVND,
      required this.color,
      required this.size});

  String name;
  String description;
  int priceVND;
  String color;
  String size;

  factory ItemsResponse.fromJson(Map<String, dynamic> json) => ItemsResponse(
      name: json['name'],
      description: json['description'],
      priceVND: json['priceVND'],
      color: json['color'],
      size: json['size']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "priceVND": priceVND,
        "color": color,
        "size": size,
      };
}
