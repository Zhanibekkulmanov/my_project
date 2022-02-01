// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['body'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
