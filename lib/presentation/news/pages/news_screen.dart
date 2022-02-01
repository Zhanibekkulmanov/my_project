import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/core/const/color_styles.dart';
import 'package:my_project/core/const/text_styles.dart';
import 'package:my_project/core/routes/routes_const.dart';
import 'package:my_project/logic/news/bloc/news_bloc.dart';
import 'package:my_project/presentation/widgets/app_bar_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   automaticallyImplyMiddle: false,
      //   // leading: MyNavigationBackButton(),
      //   border: Border(),
      //   backgroundColor: Color(0xff322C54),
      //   middle: Text(
      //     'News',
      //     style: TextStyles.whiteSemiBoldStyle.copyWith(fontSize: 20),
      //   ),
      // ),
      child: SafeArea(
        bottom: false,
        child: Container(
          color: ColorStyles.backgroundColor,
          child: Column(
            children: [
              AppBarWidget(title: 'News', backButton: false,),
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if(state is NewsSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(height: 16,),
                              CupertinoButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true).pushNamed(NewsRoute, arguments: state.news[index]);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorStyles.cardBackgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0))
                                    ),
                                    height: 106,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width - 32,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Text(
                                            state.news[index].title, maxLines: 1,
                                            style: TextStyles.whiteRegStyle,),
                                          SizedBox(height: 8,),
                                          Text(
                                              state.news[index].body, maxLines: 2,
                                              style: TextStyles.whiteRegStyle
                                                  .copyWith(fontSize: 14,
                                                  color: ColorStyles
                                                      .whiteEightyColor)),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                      ),
                                    )
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  if (state is NewsFailure) {
                    return Text(state.message);
                  }
                  if (state is NewsLoading) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height - 141,
                        child: Center(child: CupertinoActivityIndicator())
                    );
                  }
                  return Offstage();
                },
              )
            ],
          ),
        ),
      ),
    );

  }
}


