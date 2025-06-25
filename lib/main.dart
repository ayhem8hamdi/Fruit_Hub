import 'package:advanced_ecommerce/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashView(),
    );
  }
}
