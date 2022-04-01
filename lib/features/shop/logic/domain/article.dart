import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String code;
  final String libelle;
  final double price;

  const Article({
    required this.code,
    required this.libelle,
    required this.price,
  });

  @override
  List<Object?> get props => [
        code,
        libelle,
        price,
      ];
}
