import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;

  const ButtonWidget({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: appBarColor,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: TextRegular(text: text, color: Colors.white, fontSize: 14),
      ),
    );
  }
}
