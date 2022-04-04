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

  Article.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        libelle = json['libelle'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'libelle': libelle,
        'price': price,
      };

  Map<String, String> toParam() => {
        'code': code,
        'libelle': libelle,
        'price': price.toString(),
      };
}
