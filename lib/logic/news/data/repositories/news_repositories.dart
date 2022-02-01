import 'package:dio/dio.dart';
import 'package:my_project/logic/news/data/datasources/news_datasources.dart';
import 'package:my_project/logic/news/data/models/comments_models.dart';
import 'package:my_project/logic/news/data/models/news_models.dart';


abstract class NewsRepository {
  Future<List<News>> getNews();

  Future<List<Comments>> getComments(int id);
}

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource);

  @override
  Future<List<News>> getNews() async {
    Response data = await newsRemoteDataSource.getNews();

    return (data.data as List).map((object) => News.fromJson(object)).toList();
  }

  @override
  Future<List<Comments>> getComments(int id) async {
    Response data = await newsRemoteDataSource.getComments(id);

    return (data.data as List).map((object) => Comments.fromJson(object)).toList();
  }
}