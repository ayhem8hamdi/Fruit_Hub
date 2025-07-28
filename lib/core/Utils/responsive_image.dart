import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final ImageProvider imageProvider; // AssetImage, NetworkImage, etc.
  final double imageDesignWidth; // Original design width (required)
  final double screenDesignWidth; // Design screen width (e.g., 375)
  final double imageDesignAspectRatio; // width/height (required)
  final BoxFit fit;
  final double? maxWidth;
  final double? minWidth;

  const ResponsiveImage({
    super.key,
    required this.imageProvider,
    required this.imageDesignWidth,
    required this.screenDesignWidth,
    required this.imageDesignAspectRatio,
    this.fit = BoxFit.cover,
    this.maxWidth,
    this.minWidth,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final responsiveWidth =
        (imageDesignWidth / screenDesignWidth) * screenWidth;

    final clampedWidth = responsiveWidth.clamp(
      minWidth ?? imageDesignWidth * 0.8,
      maxWidth ?? imageDesignWidth * 1.3,
    );

    return SizedBox(
      width: clampedWidth,
      child: AspectRatio(
        aspectRatio: imageDesignAspectRatio,
        child: Image(
          image: imageProvider,
          fit: fit,
        ),
      ),
    );
  }
}
