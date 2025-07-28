import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardScreenBody extends StatelessWidget {
  const CardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [],
      ),
    );
  }
}
