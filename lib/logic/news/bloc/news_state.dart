part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsFailure extends NewsState {
  final String message;

  NewsFailure(this.message);
}

class NewsSuccess extends NewsState {
  final List<News> news;

  NewsSuccess(this.news);
}

class CommentsSuccess extends NewsState {
  final List<Comments> comments;

  CommentsSuccess(this.comments);
}

class NewsLoading extends NewsState {}

