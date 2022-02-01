import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/core/routes/router.dart';
import 'package:my_project/main_sceen.dart';

import 'core/injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
        debugShowCheckedModeBanner: false,
        // theme: CupertinoThemeData(brightness: Brightness.light),
        home: MainScreen()
    );
  }
}

