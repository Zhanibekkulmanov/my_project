import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_project/logic/news/bloc/news_bloc.dart';
import 'package:my_project/logic/news/data/datasources/news_datasources.dart';
import 'package:my_project/logic/news/data/repositories/news_repositories.dart';

var sl = GetIt.instance;

Future<void> initGetIt() async {

  sl.registerFactory<Dio>(
        () => Dio(BaseOptions()),
  );

  sl.registerFactory<NewsBloc>(() => NewsBloc(sl()));

  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(sl()));

  sl.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(sl()));
}
