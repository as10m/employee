// To parse this JSON data, do
//
//     final EmployeeList = EmployeeListFromJson(jsonString);

import 'dart:convert';

EmployeeList EmployeeListFromJson(String str) => EmployeeList.fromJson(json.decode(str));

String EmployeeListToJson(EmployeeList data) => json.encode(data.toJson());

class EmployeeList {
  EmployeeList({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Datum> data;
  Support support;

  factory EmployeeList.fromJson(Map<String, dynamic> json) => EmployeeList(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    support: Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "support": support.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,

    required this.firstName,

  });

  int id;
  String firstName;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    firstName: json["first_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
  };
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
