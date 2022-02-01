part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class NewsDataLoaded extends NewsEvent {}

class NewsCommentsLoaded extends NewsEvent {
  final int id;

  NewsCommentsLoaded(this.id);
}

// class CommentsDataLoaded extends NewsEvent {}