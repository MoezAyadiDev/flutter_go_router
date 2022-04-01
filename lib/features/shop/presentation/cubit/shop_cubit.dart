import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_go_router/features/shop/logic/domain/article.dart';
import 'package:flutter_go_router/features/shop/logic/service/article_service.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  final ArticleService _service;
  ShopCubit(ArticleService service)
      : _service = service,
        super(ShopInitial());
  getArticle() async {
    emit(ShopLoading());
    var _articles = await _service.getArticle();
    Random random = Random();
    int _result = random.nextInt(1);
    if (_result == 0) {
      emit(ShopLoaded(articles: _articles));
    } else {
      emit(ShopFailed());
    }
  }
}
