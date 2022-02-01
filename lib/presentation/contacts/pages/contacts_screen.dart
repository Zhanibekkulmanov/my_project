import 'package:flutter/cupertino.dart';
import 'package:my_project/core/const/color_styles.dart';
import 'package:my_project/presentation/widgets/app_bar_widget.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: ColorStyles.backgroundColor,
        child: Column(
          children: [
            AppBarWidget(title: 'Gallery', backButton: false,)
          ],
        ),
      ),
    );
  }
}
