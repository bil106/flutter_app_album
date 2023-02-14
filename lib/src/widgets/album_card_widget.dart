import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_colors.dart';
import 'package:flutter_app/src/common/constants/app_ui_helpers.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:flutter_app/src/presentation/shared/style.dart';
import 'package:flutter_app/src/widgets/heading/body.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AlbumCardWidget extends StatelessWidget {
  final AlbumData model;
  final Function() onTap;

  const AlbumCardWidget({super.key, required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var index = model.id;
    return Card(
        child: ListTile(
      minVerticalPadding: 14,
      title: Row(children: <Widget>[
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: borderRadiusCircular,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://source.unsplash.com/random?sig=$index'))),
        ),
        const Padding(padding: kHorizonalLeftInsets),
        Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              model.title,
              style: headingStyle(),
            ),
          ],
        )),
      ]),
      subtitle: _subtitle(),
      onTap: onTap,
      trailing: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: model.url ?? '',
        errorWidget: (context, url, error) => const SizedBox.shrink(),
      ),
    ));
  }

  _subtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Body(
          text: 'id: ${model.id}',
          color: kcPrimaryLightTextColor,
        )
      ],
    );
  }
}
