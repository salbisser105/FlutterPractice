// To parse this JSON data, do
//
//     final searchResponseModel = searchResponseModelFromMap(jsonString);

import 'dart:convert';

import 'package:movies_app/models/models.dart';

class SearchResponseModel {
  SearchResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory SearchResponseModel.fromJson(String str) =>
      SearchResponseModel.fromMap(json.decode(str));

  factory SearchResponseModel.fromMap(Map<String, dynamic> json) =>
      SearchResponseModel(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
