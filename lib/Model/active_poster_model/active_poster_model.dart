// To parse this JSON data, do
//
//     final activePosterModel = activePosterModelFromJson(jsonString);

import 'dart:convert';

ActivePosterModel activePosterModelFromJson(String str) => ActivePosterModel.fromJson(json.decode(str));

String activePosterModelToJson(ActivePosterModel data) => json.encode(data.toJson());

class ActivePosterModel {
  bool success;
  List<Poster> poster;

  ActivePosterModel({
    required this.success,
    required this.poster,
  });

  factory ActivePosterModel.fromJson(Map<String, dynamic> json) => ActivePosterModel(
    success: json["success"],
    poster: List<Poster>.from(json["poster"].map((x) => Poster.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "poster": List<dynamic>.from(poster.map((x) => x.toJson())),
  };
}

class Poster {
  String id;
  String image;
  String status;
  int v;

  Poster({
    required this.id,
    required this.image,
    required this.status,
    required this.v,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
    id: json["_id"],
    image: json["image"],
    status: json["status"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "status": status,
    "__v": v,
  };
}
