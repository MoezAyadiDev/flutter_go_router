import 'package:flutter/material.dart';
import 'package:flutter_go_router/feature/app/core/injection/injection.dart';
import 'package:flutter_go_router/feature/app/presentation/ui/app_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //configureDependencies();
  configureDependencies();
  //await resolveDependencies();
  runApp(const AppPage());
}
