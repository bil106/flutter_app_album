import 'package:flutter/material.dart';

import 'package:flutter_app/src/common/http/photo_loader.dart';

import 'package:flutter_app/src/theme/colors.dart';

List<Photo>? photos;
Exception? exception;
Photo? photo;
Widget getPhotos(BuildContext context, index) {
  final albumId = '${photos![index].albumId}  ${photos![index].title}';
  final thumbnailUrl = photos![index].thumbnailUrl;
  final albumImage = photos![index].url;

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Row(children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(albumImage.toString()))),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  albumId,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  thumbnailUrl.toString(),
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          )
        ]),
      ),
    ),
  );
}
