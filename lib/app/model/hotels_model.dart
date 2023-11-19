
import 'dart:convert';

List<HotelsGo> hotelsGoFromJson(String str) => List<HotelsGo>.from(json.decode(str).map((x) => HotelsGo.fromJson(x)));

String hotelsGoToJson(List<HotelsGo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelsGo {
  String name;
  int starts;
  int price;
  String currency;
  String image;
  double reviewScore;
  String review;
  String address;

  HotelsGo({
    required this.name,
    required this.starts,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  factory HotelsGo.fromJson(Map<String, dynamic> json) => HotelsGo(
    name: json["name"],
    starts: json["starts"],
    price: json["price"],
    currency: json["currency"],
    image: json["image"],
    reviewScore: json["review_score"]?.toDouble(),
    review: json["review"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "starts": starts,
    "price": price,
    "currency": currency,
    "image": image,
    "review_score": reviewScore,
    "review": review,
    "address": address,
  };
}
