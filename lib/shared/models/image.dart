// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

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
    this.imageId,
  });

  String id;
  String name;
  dynamic alternativeText;
  dynamic caption;
  String hash;
  String ext;
  String mime;
  double size;
  int width;
  int height;
  String url;
  Formats formats;
  String provider;
  List<dynamic> related;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
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
    related: List<dynamic>.from(json["related"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
    "id": imageId,
  };
}

class Formats {
  Formats({
    this.thumbnail,
    this.small,
  });

  Small thumbnail;
  Small small;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    thumbnail: Small.fromJson(json["thumbnail"]),
    small: Small.fromJson(json["small"]),
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail.toJson(),
    "small": small.toJson(),
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
