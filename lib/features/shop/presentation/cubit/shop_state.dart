part of 'shop_cubit.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {}

class ShopLoaded extends ShopState {
  final List<Article> articles;
  const ShopLoaded({required this.articles});
  @override
  List<Object> get props => [articles];
}

class ShopFailed extends ShopState {}
