import 'package:flutter/material.dart';
import 'package:flutter_go_router/features/app/core/util/injection/injection.dart'
    as di;
import 'package:flutter_go_router/features/app/presentation/ui/shop_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.setupInjection();
  runApp(const ShopApp());
}
