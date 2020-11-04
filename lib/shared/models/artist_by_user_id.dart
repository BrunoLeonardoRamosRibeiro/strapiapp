// To parse this JSON data, do
//
//     final artistByUserId = artistByUserIdFromJson(jsonString);

import 'dart:convert';

ArtistByUserId artistByUserIdFromJson(String str) => ArtistByUserId.fromJson(json.decode(str));

String artistByUserIdToJson(ArtistByUserId data) => json.encode(data.toJson());

class ArtistByUserId {
  ArtistByUserId({
    this.artists,
    this.id,
    this.cpf,
    this.rg,
    this.phone,
    this.creditCard,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.user,
    this.artistByUserIdId,
  });

  List<Artist> artists;
  String id;
  String cpf;
  String rg;
  String phone;
  dynamic creditCard;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  User user;
  String artistByUserIdId;

  factory ArtistByUserId.fromJson(Map<String, dynamic> json) => ArtistByUserId(
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
    id: json["_id"],
    cpf: json["cpf"],
    rg: json["rg"],
    phone: json["phone"],
    creditCard: json["creditCard"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    user: User.fromJson(json["user"]),
    artistByUserIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "_id": id,
    "cpf": cpf,
    "rg": rg,
    "phone": phone,
    "creditCard": creditCard,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "user": user.toJson(),
    "id": artistByUserIdId,
  };
}

class Plan {
  Plan({
    this.benefits,
    this.id,
    this.valuePlan,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.plan,
    this.planId,
  });

  List<Benefit> benefits;
  String id;
  double valuePlan;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Artist plan;
  String planId;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    benefits: List<Benefit>.from(json["benefits"].map((x) => Benefit.fromJson(x))),
    id: json["_id"],
    valuePlan: json["valuePlan"].toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    plan: Artist.fromJson(json["plan"]),
    planId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "benefits": List<dynamic>.from(benefits.map((x) => x.toJson())),
    "_id": id,
    "valuePlan": valuePlan,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "plan": plan.toJson(),
    "id": planId,
  };
}

class Artist {
  Artist({
    this.id,
    this.name,
    this.biography,
    this.freeContent,
    this.plans,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.createdBy,
    this.image,
    this.updatedBy,
    this.artistId,
    this.benefits,
    this.description,
    this.price,
  });

  String id;
  String name;
  String biography;
  List<FreeContent> freeContent;
  List<Plan> plans;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  AtedBy createdBy;
  Image image;
  String updatedBy;
  String artistId;
  List<String> benefits;
  String description;
  double price;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    id: json["_id"],
    name: json["name"],
    biography: json["biography"] == null ? null : json["biography"],
    freeContent: json["freeContent"] == null ? null : List<FreeContent>.from(json["freeContent"].map((x) => FreeContent.fromJson(x))),
    plans: json["plans"] == null ? null : List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    createdBy: atedByValues.map[json["created_by"]],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    updatedBy: json["updated_by"],
    artistId: json["id"],
    benefits: json["benefits"] == null ? null : List<String>.from(json["benefits"].map((x) => x)),
    description: json["description"] == null ? null : json["description"],
    price: json["price"] == null ? null : json["price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "biography": biography == null ? null : biography,
    "freeContent": freeContent == null ? null : List<dynamic>.from(freeContent.map((x) => x.toJson())),
    "plans": plans == null ? null : List<dynamic>.from(plans.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "created_by": atedByValues.reverse[createdBy],
    "image": image == null ? null : image.toJson(),
    "updated_by": updatedBy,
    "id": artistId,
    "benefits": benefits == null ? null : List<dynamic>.from(benefits.map((x) => x)),
    "description": description == null ? null : description,
    "price": price == null ? null : price,
  };
}

class Benefit {
  Benefit({
    this.type,
    this.id,
    this.title,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.createdBy,
    this.updatedBy,
    this.benefitId,
  });

  String type;
  String id;
  String title;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  AtedBy createdBy;
  AtedBy updatedBy;
  String benefitId;

  factory Benefit.fromJson(Map<String, dynamic> json) => Benefit(
    type: json["type"],
    id: json["_id"],
    title: json["title"],
    quantity: json["quantity"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    createdBy: atedByValues.map[json["created_by"]],
    updatedBy: atedByValues.map[json["updated_by"]],
    benefitId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "_id": id,
    "title": title,
    "quantity": quantity,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "created_by": atedByValues.reverse[createdBy],
    "updated_by": atedByValues.reverse[updatedBy],
    "id": benefitId,
  };
}

enum AtedBy { THE_5_F49604716015_D001770_D8_CA, THE_5_F4_DA04_E8388_C000174_EDC02 }

final atedByValues = EnumValues({
  "5f49604716015d001770d8ca": AtedBy.THE_5_F49604716015_D001770_D8_CA,
  "5f4da04e8388c000174edc02": AtedBy.THE_5_F4_DA04_E8388_C000174_EDC02
});

class FreeContent {
  FreeContent({
    this.component,
    this.id,
    this.description,
    this.date,
    this.time,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.freeContentId,
  });

  String component;
  String id;
  String description;
  DateTime date;
  String time;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String freeContentId;

  factory FreeContent.fromJson(Map<String, dynamic> json) => FreeContent(
    component: json["__component"],
    id: json["_id"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    freeContentId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "__component": component,
    "_id": id,
    "description": description,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": freeContentId,
  };
}

class Image {
  Image({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.width,
    this.height,
    this.url,
    this.formats,
    this.provider,
    this.related,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.createdBy,
    this.updatedBy,
    this.imageId,
  });

  String id;
  String name;
  String alternativeText;
  String caption;
  String hash;
  String ext;
  String mime;
  double size;
  int width;
  int height;
  String url;
  Formats formats;
  String provider;
  List<String> related;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  AtedBy createdBy;
  AtedBy updatedBy;
  String imageId;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["_id"],
    name: json["name"],
    alternativeText: json["alternativeText"],
    caption: json["caption"],
    hash: json["hash"],
    ext: json["ext"],
    mime: json["mime"],
    size: json["size"].toDouble(),
    width: json["width"],
    height: json["height"],
    url: json["url"],
    formats: Formats.fromJson(json["formats"]),
    provider: json["provider"],
    related: List<String>.from(json["related"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    createdBy: atedByValues.map[json["created_by"]],
    updatedBy: atedByValues.map[json["updated_by"]],
    imageId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "alternativeText": alternativeText,
    "caption": caption,
    "hash": hash,
    "ext": ext,
    "mime": mime,
    "size": size,
    "width": width,
    "height": height,
    "url": url,
    "formats": formats.toJson(),
    "provider": provider,
    "related": List<dynamic>.from(related.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "created_by": atedByValues.reverse[createdBy],
    "updated_by": atedByValues.reverse[updatedBy],
    "id": imageId,
  };
}

class Formats {
  Formats({
    this.thumbnail,
    this.small,
    this.large,
    this.medium,
  });

  Small thumbnail;
  Small small;
  Small large;
  Small medium;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    thumbnail: Small.fromJson(json["thumbnail"]),
    small: Small.fromJson(json["small"]),
    large: json["large"] == null ? null : Small.fromJson(json["large"]),
    medium: json["medium"] == null ? null : Small.fromJson(json["medium"]),
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail.toJson(),
    "small": small.toJson(),
    "large": large == null ? null : large.toJson(),
    "medium": medium == null ? null : medium.toJson(),
  };
}

class Small {
  Small({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.width,
    this.height,
    this.size,
    this.path,
    this.url,
  });

  String name;
  String hash;
  String ext;
  String mime;
  int width;
  int height;
  double size;
  dynamic path;
  String url;

  factory Small.fromJson(Map<String, dynamic> json) => Small(
    name: json["name"],
    hash: json["hash"],
    ext: json["ext"],
    mime: json["mime"],
    width: json["width"],
    height: json["height"],
    size: json["size"].toDouble(),
    path: json["path"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "hash": hash,
    "ext": ext,
    "mime": mime,
    "width": width,
    "height": height,
    "size": size,
    "path": path,
    "url": url,
  };
}

class User {
  User({
    this.confirmed,
    this.blocked,
    this.id,
    this.username,
    this.email,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.role,
    this.userId,
  });

  bool confirmed;
  bool blocked;
  String id;
  String username;
  String email;
  String provider;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String role;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    confirmed: json["confirmed"],
    blocked: json["blocked"],
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    provider: json["provider"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    role: json["role"],
    userId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "confirmed": confirmed,
    "blocked": blocked,
    "_id": id,
    "username": username,
    "email": email,
    "provider": provider,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "role": role,
    "id": userId,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
