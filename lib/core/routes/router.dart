import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/core/routes/routes_const.dart';
import 'package:my_project/logic/news/data/models/news_models.dart';
import 'package:my_project/main_sceen.dart';
import 'package:my_project/presentation/news/pages/post_screen.dart';
import 'package:my_project/presentation/widgets/buttons/back_button.dart';


class MyRouter {

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {

    final parts = routeSettings.name!.split('?');
    // List<dynamic> args = routeSettings.arguments as List;

    switch (parts[0]) {
      case MainRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => MainScreen(),
        );
      case NewsRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => PostScreen(news: routeSettings.arguments as News)
        );
      default:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>
              CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  leading: MyNavigationBackButton(
                    color: Colors.black,
                  ),
                  middle: Text('Навигация'),
                ),
                child: Center(
                  child: Text(
                    'Ошибка, роут для ${routeSettings.name} не найден',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        );
    }
  }
}
