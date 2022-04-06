import 'package:flutter/material.dart';
import 'package:flutter_go_router/features/app/presentation/ui/widget/session_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: const Center(
        child: Text('Splash'),
      ),
    );
  }
}
