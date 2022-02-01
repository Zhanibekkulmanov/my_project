import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/core/const/color_styles.dart';
import 'package:my_project/core/const/text_styles.dart';

class CommentWidget extends StatelessWidget {
  final String? name;
  final String? comment;
  const CommentWidget({Key? key, required this.name, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyles.cardBackgroundColor,
      width: MediaQuery.of(context).size.width - 32,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                ),
                SizedBox(width: 16,),
                Flexible(child: Text(name ?? '2',style: TextStyles.whiteSemiBoldStyle, maxLines: 1,))
              ],
            ),
            SizedBox(height: 16,),
            Text(comment ?? '1', maxLines: 4, style: TextStyles.whiteRegStyle.copyWith(fontSize: 14, color: ColorStyles.whiteColor.withOpacity(0.7)),)
          ],
        ),
      ),
    );
  }
}
