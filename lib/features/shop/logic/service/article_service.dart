import 'package:flutter_go_router/features/shop/logic/domain/article.dart';
import 'package:flutter_go_router/features/shop/logic/repository/article_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArticleService {
  final ArticleRepository _repository;

  const ArticleService(ArticleRepository repository) : _repository = repository;

  Future<List<Article>> getArticle() async {
    await Future.delayed(const Duration(seconds: 1));
    return _repository.getArticle();
  }
}
