import 'package:dio/dio.dart';

abstract class NewsRemoteDataSource {
  Future<Response> getNews();

  Future<Response> getComments(int id);
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl(this.dio);

  @override
  Future<Response> getNews() async{
    Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    return response;
  }
  @override
  Future<Response> getComments(int id) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/comments?postId=$id');

    // ignore: avoid_print
    print("sssssssssssss");
    print(response.data);

    return response;
  }
}