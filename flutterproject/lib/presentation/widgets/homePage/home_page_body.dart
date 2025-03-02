import 'package:flutter/cupertino.dart';
import 'package:flutterproject/core/constant/sized_box.dart';
import 'package:flutterproject/core/extension/padding_extension.dart';

import 'ai_gridview_widget.dart';
import 'header_text_widget.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizeConstant.largeheight,
            HeaderTextWidget(),
            SizeConstant.largeheight,
            AiGridviewWidget()
          ],
        ),
      ).symmetricPadding(horizontal: 20.0,vertical: 40.0);
  }
}
