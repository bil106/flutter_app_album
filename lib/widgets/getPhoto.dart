import 'package:flutter/material.dart';
import 'package:flutter_app/dataloader.dart';
import 'package:flutter_app/photoLoader.dart';


import 'package:flutter_app/theme/colors.dart';

late List<Photo>? photos=null ;
late Exception? exception = null;


Widget getPhotos(index) {
  
  
  
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
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(albumImage))),
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
                  thumbnailUrl,
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
