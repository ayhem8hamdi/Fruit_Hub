import 'dart:ui';
import 'package:flutter/material.dart';

class PurchaseBottomSheet extends StatelessWidget {
  const PurchaseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.white.withOpacity(0.9),
          padding: const EdgeInsets.all(16),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PurchaseHeader(),
              SizedBox(height: 12),
              PurchaseBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class PurchaseHeader extends StatelessWidget {
  const PurchaseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Purchase Item',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PurchaseBody extends StatelessWidget {
  const PurchaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Confirm your purchase below:'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Confirm Purchase'),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
