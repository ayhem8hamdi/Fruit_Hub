import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final ImageProvider? imageProvider;
  final Widget? customImageWidget;
  final double imageDesignWidth; // width in design file (e.g., 64)
  final double screenDesignWidth; // screen width in design (e.g., 375)
  final double imageDesignAspectRatio; // width / height
  final BoxFit fit;
  final double? maxWidth;
  final double? minWidth;

  const ResponsiveImage({
    super.key,
    this.imageProvider,
    this.customImageWidget,
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0), // Optional
          child: imageProvider != null
              ? Image(image: imageProvider!, fit: fit)
              : FittedBox(
                  fit: fit,
                  clipBehavior: Clip.hardEdge,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(),
                    child: customImageWidget ?? const SizedBox.shrink(),
                  ),
                ),
        ),
      ),
    );
  }
}
