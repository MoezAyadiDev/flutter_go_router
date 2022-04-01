import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_go_router/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:flutter_go_router/features/shop/presentation/ui/widget/article_card.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ShopFailed) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Erreur de chargement de list d\'article')));
        }
      },
      builder: (context, state) {
        if (state is ShopLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShopLoaded) {
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) =>
                ArticleCard(article: state.articles[index]),
          );
        }
        return const Center(
          child: Text('No data to display'),
        );
      },
    );
  }
}
