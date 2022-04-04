import 'package:flutter/material.dart';
import 'package:flutter_go_router/features/shop/logic/domain/article.dart';

class DetailBody extends StatelessWidget {
  final Article article;
  const DetailBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          article.libelle,
          style: const TextStyle(fontSize: 20.0),
        ),
        Text(
          article.code,
          style: const TextStyle(fontSize: 15.0),
        ),
        Text(
          article.price.toString(),
          style: const TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
