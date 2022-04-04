import 'package:flutter/material.dart';
import 'package:flutter_go_router/features/app/presentation/ui/widget/session_widget.dart';
import 'package:flutter_go_router/features/shop/logic/domain/article.dart';

class DetailScreen extends StatelessWidget {
  final String article;
  //final Article article;
  const DetailScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SessionWidget(
      child: Scaffold(
        appBar: AppBar(
          //title: Text('Detail Screen ${article.libelle}'),
          title: Text('Detail Screen $article'),
        ),
        //body: DetailScreen(article: article),
      ),
    );
  }
}
