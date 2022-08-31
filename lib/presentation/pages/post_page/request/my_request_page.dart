import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class MyRequestPage extends StatelessWidget {
  const MyRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('My Request'),
    );
  }
}
