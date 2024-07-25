import 'package:flutter/material.dart';

class ShowZoomableImage extends StatefulWidget {
  const ShowZoomableImage({super.key});

  @override
  State<ShowZoomableImage> createState() => _ShowZoomableImageState();
}

class _ShowZoomableImageState extends State<ShowZoomableImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoomable Image'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      
      body: Center(
        child: InteractiveViewer(
          minScale: 1.0,
            maxScale: 3.0,
            child: Image.network('https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png')),
      ),
    );
  }
}
