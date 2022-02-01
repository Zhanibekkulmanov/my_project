import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/core/const/color_styles.dart';
import 'package:my_project/core/const/text_styles.dart';
import 'package:my_project/core/injection_container.dart';
import 'package:my_project/logic/news/bloc/news_bloc.dart';
import 'package:my_project/logic/news/data/models/news_models.dart';
import 'package:my_project/presentation/news/widgets/comment_widget.dart';
import 'package:my_project/presentation/widgets/app_bar_widget.dart';

class PostScreen extends StatefulWidget {
  final News news;

  const PostScreen({Key? key, required this.news}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<NewsBloc>()
        ..add(NewsCommentsLoaded(widget.news.id)),
      child: CupertinoPageScaffold(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppBarWidget(title: 'Title', backButton: true,),
              Expanded(
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is CommentsSuccess) {
                      return Stack(
                        children: [
                          Container(
                            color: ColorStyles.backgroundColor,
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 33,),
                                          Text(
                                            widget.news.title,
                                            style: TextStyles.whiteRegStyle,),
                                          SizedBox(height: 26,),
                                          Text(
                                              widget.news.body,
                                              style: TextStyles.whiteRegStyle.copyWith(fontSize: 14,
                                                  color: ColorStyles.whiteEightyColor)),
                                          SizedBox(height: 32,),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: state.comments.length,
                                            itemBuilder: (context, index) {
                                              // print(state.comments[0].name);
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: CommentWidget(
                                                  name: state.comments[index]
                                                      .name,
                                                  comment: state.comments[index]
                                                      .body,),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70,)
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              child: Container(
                                height: 64,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                    color: ColorStyles.lightBlue,
                                    //new Color.fromRGBO(255, 0, 0, 0.0),
                                    borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(10.0),
                                        topRight: const Radius.circular(10.0))
                                ),
                                child: CupertinoButton(
                                  onPressed: (){},
                                  padding: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 26),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Show me ', style: TextStyles.whiteRegStyle.copyWith(color: ColorStyles.whiteColorHalf,fontSize: 18.67),),
                                            Text('${state.comments.length} results', style: TextStyles.whiteSemiBoldStyle.copyWith(fontSize: 18.67),)
                                          ],
                                        ),
                                        Icon(
                                          Icons.visibility_outlined,
                                          size: 25,
                                          color: ColorStyles.whiteColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          )
                        ],
                      );
                    }
                    if (state is NewsLoading) {
                      return Center(
                          child: CupertinoActivityIndicator());
                    }
                    if (state is NewsFailure) {
                      print(state.message);
                    }
                    return Offstage();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}