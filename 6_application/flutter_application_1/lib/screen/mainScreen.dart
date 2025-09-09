import 'package:flutter/material.dart';
import '/models/photos.dart'; // путь до модели, где описан объект photo

class MainScreen extends StatelessWidget {
  final List<Photos> photos;

  const MainScreen({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(photo.imgSrc!),
        );
      },
    );
  }
}