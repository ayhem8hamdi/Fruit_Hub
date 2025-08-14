import 'package:advanced_ecommerce/core/Utils/ui_errors_handler.dart';
import 'package:flutter/material.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({super.key});

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  bool isFavourite = false;

  void _toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
    isFavourite == true
        ? UiHandler.showFlushBar(context, 'تمت الإضافة إلى المفضلة',
            isError: false)
        : UiHandler.showFlushBar(context, 'تمت الإزالة من المفضلة',
            isError: true);

    // we should handle added to favourite cubit here
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleFavourite,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: Icon(
          isFavourite ? Icons.favorite : Icons.favorite_border,
          key: ValueKey<bool>(isFavourite),
          size: 23,
          color: isFavourite ? Colors.red : null,
        ),
      ),
    );
  }
}
