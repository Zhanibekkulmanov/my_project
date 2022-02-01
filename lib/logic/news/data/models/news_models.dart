import 'package:json_annotation/json_annotation.dart';

part 'news_models.g.dart';


@JsonSerializable()
class News {
  final int userId;
  final int id;
  final String title;
  final String body;

  News(this.userId, this.id, this.title, this.body);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
