import 'package:flutter/cupertino.dart';
import 'package:my_project/core/const/color_styles.dart';
import 'package:my_project/presentation/widgets/app_bar_widget.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
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
