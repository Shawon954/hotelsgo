
import 'dart:convert';

List<Hoteldata> hoteldataFromJson(String str) => List<Hoteldata>.from(json.decode(str).map((x) => Hoteldata.fromJson(x)));

String hoteldataToJson(List<Hoteldata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hoteldata {
  String name;
  int starts;
  int price;
  String currency;
  String image;
  double reviewScore;
  String review;
  String address;

  Hoteldata({
    required this.name,
    required this.starts,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  factory Hoteldata.fromJson(Map<String, dynamic> json) => Hoteldata(
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
