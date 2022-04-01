import 'package:flutter_go_router/features/shop/logic/domain/article.dart';

class ArticleRepository {
  List<Article> getArticle() => const [
        Article(code: '001', libelle: 'Pc Portable tochiba', price: 2800.00),
        Article(code: '002', libelle: 'Pc Portable Hp', price: 4200.00),
        Article(code: '003', libelle: 'Pc Portable Lenovo', price: 3650.00),
        Article(code: '004', libelle: 'Pc Portable Dell', price: 3240.00),
        Article(code: '004', libelle: 'Pc Portable Mac', price: 7825.00),
      ];
}
