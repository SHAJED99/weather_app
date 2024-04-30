import 'package:flutter/material.dart';
import 'package:weather_app/components.dart';
import 'package:weather_app/src/views/widgets/loading_bar.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(this.url, {super.key, this.alignment = Alignment.center, this.fit});
  final String url;
  final Alignment alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme.onBackground;
    return Image.network(
      "https:$url",
      fit: fit,
      alignment: alignment,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (frame == null) {
          return Container(
            alignment: Alignment.center,
            height: defaultPadding,
            width: defaultPadding,
            child: AspectRatio(
              aspectRatio: 1,
              child: CircularProgressIndicator(color: c),
            ),
          );
        }
        return child;
      },
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.image_not_supported, color: c, size: defaultPadding);
      },
    );
  }
}
