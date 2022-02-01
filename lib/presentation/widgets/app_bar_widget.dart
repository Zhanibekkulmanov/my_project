import 'package:flutter/cupertino.dart';
import 'package:my_project/core/const/color_styles.dart';
import 'package:my_project/core/const/text_styles.dart';
import 'package:my_project/presentation/widgets/buttons/back_button.dart';

class AppBarWidget extends StatefulWidget {
  final String title;
  final bool backButton;
  const AppBarWidget({Key? key, required this.title, required this.backButton}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff322C54),
              Color(0xff231D49),
            ],
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0))
      ),
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        // alignment: AlignmentDirectional.,
        children: [
          widget.backButton ? Padding(
            padding: const EdgeInsets.only(left: 20),
            child: MyNavigationBackButton(color: ColorStyles.whiteColor,),
          ) : Offstage(),
          Center(child: Text(widget.title,
            style: TextStyles.whiteSemiBoldStyle.copyWith(fontSize: 20),)),
        ],
      ),
    );
  }
}
