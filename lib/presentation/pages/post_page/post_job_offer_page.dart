import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PostJobOfferPage extends StatelessWidget {
  const PostJobOfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('Posting Job Offer'),
    );
  }
}
