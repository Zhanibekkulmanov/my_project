import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_project/logic/news/data/models/comments_models.dart';
import 'package:my_project/logic/news/data/models/news_models.dart';
import 'package:my_project/logic/news/data/repositories/news_repositories.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<NewsDataLoaded>((event, emit) async {
      emit(NewsLoading());
      try {
        final List<News> news = await newsRepository.getNews();
        // final List<Comments> comments = await newsRepository.getComments();

        emit(NewsSuccess(news));
      }
      catch (e) {
        emit(NewsFailure(e.toString()));
      }
    });
    on<NewsCommentsLoaded>((event, emit) async {
      emit(NewsLoading());
      try {
        final List<Comments> comments = await newsRepository.getComments(event.id);

        print("sssssssss");
        print(comments.length);

        emit(CommentsSuccess(comments));
      }
      catch (e) {
        emit(NewsFailure(e.toString()));
      }
    });
    // on<CommentsDataLoaded>((event, emit) async {
    //   emit(NewsLoading());
    //   try {
    //     emit(CommentsSuccess(comments));
    //   }
    //   catch (e) {
    //     emit(NewsFailure(e.toString()));
    //   }
    // });
  }

  // Stream<NewsState> mapEventToState(NewsEvent event) async* {
  //   if(event is NewsDataLoaded){
  //     yield NewsLoading();
  //     try {
  //       final List<News> news = await newsRepository.getNews();
  //       yield NewsSuccess(news);
  //     }
  //     catch (e) {
  //       yield NewsFailure(e.toString());
  //       throw e.toString();
  //     }
  //   }
  // }
}
