import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../utils/constant/colors.dart';

PreferredSizeWidget AppbarWidget(String title) {
  return AppBar(
    backgroundColor: appBarColor,
    title: TextBold(text: title, color: Colors.white, fontSize: 18),
    centerTitle: true,
  );
}
