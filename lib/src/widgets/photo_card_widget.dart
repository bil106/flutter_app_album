import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_colors.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/widgets/heading/body.dart';

class PhotoCardWidget extends StatelessWidget {
  final AlbumData model;
  final Function() onTap;

  const PhotoCardWidget({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: model.url ?? "",
        errorWidget: (context, url, error) => const SizedBox.shrink(),
      ),
    );
  }

  _subtitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Body(
        text: "id: ${model.id}",
        color: kcPrimaryLightTextColor,
      )
    ]);
  }
}
