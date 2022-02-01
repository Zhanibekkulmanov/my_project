import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/core/const/color_styles.dart';
import 'package:my_project/presentation/check/pages/check_screen.dart';
import 'package:my_project/presentation/contacts/pages/contacts_screen.dart';
import 'package:my_project/presentation/gallery/pages/gallery_screen.dart';
import 'package:my_project/presentation/news/pages/news_screen.dart';
import 'core/injection_container.dart';
import 'logic/news/bloc/news_bloc.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key,}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Color(0xff322C54),
        activeColor: ColorStyles.whiteColor,
        inactiveColor: ColorStyles.iconColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_outlined,),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task_outlined,
            ),
            label: 'Check',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.import_contacts_outlined,
            ),
            label: 'Contacts',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
              builder: (context) =>
                  BlocProvider(
                    create: (context) => sl<NewsBloc>()..add(NewsDataLoaded()),
                    child: CupertinoPageScaffold(child: NewsScreen()),
                  ),
            );
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: GalleryScreen(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CheckScreen(),
              );
            });
            break;
          case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ContactsScreen(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
