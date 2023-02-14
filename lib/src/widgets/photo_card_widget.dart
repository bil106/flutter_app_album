import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/models/album.dart';

class PhotoCardWidget extends StatelessWidget {
  final AlbumData model;
  final Function onTap;
  const PhotoCardWidget({super.key, required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CachedNetworkImage(
        imageUrl: model.url ?? '',
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const SizedBox.shrink(),
      ),
    );
  }
  
}
