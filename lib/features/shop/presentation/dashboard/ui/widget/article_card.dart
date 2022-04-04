import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/app/presentation/ui/cubit/session_cubit.dart';
import 'package:flutter_go_router/features/shop/logic/domain/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(article.code),
      ),
      title: Text(article.libelle),
      trailing: Text(article.price.toString()),
      onTap: () {
        _onTap(context);
      },
    );
  }

  _onTap(BuildContext context) {
    BlocProvider.of<SessionCubit>(context).showDetail(article: article);
  }
}