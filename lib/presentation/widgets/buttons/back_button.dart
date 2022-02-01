import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigationBackButton extends StatefulWidget {
  final Color? color;

  const MyNavigationBackButton({Key? key, this.color}) : super(key: key);

  @override
  _MyNavigationBackButtonState createState() =>
      _MyNavigationBackButtonState();
}

class _MyNavigationBackButtonState extends State<MyNavigationBackButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Navigator.maybePop(context),
      padding: EdgeInsets.zero,
      child: Container(
        width: 50,
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.arrow_back_outlined,
          color: widget.color,
          size: 24,
        ),
      ),
    );
  }
}
