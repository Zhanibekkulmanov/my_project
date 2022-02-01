import 'package:flutter/cupertino.dart';
import 'package:my_project/core/const/color_styles.dart';
import 'package:my_project/presentation/widgets/app_bar_widget.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  _CheckScreenState createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: ColorStyles.backgroundColor,
        child: Column(
          children: [
            AppBarWidget(title: 'Check', backButton: false,),
          ],
        ),
      ),
    );
  }
}
