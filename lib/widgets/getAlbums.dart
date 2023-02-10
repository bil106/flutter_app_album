 import 'package:flutter/material.dart';
import 'package:flutter_app/dataloader.dart';
import 'package:flutter_app/theme/colors.dart';
 late List<Album>? albums = null;
  late Exception? exception = null;
Widget getAlbums(index) {
    final albumId = '${albums![index].albumId}  ${albums![index].title}';
    final thumbnailUrl=albums![index].thumbnailUrl;
    final albumImage = albums![index].url;
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
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                          albumImage))
              ),
            ),
          const  SizedBox(width: 20,),
        
         Flexible(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: <Widget>[
              Text(
                    albumId,
                    
                    style:const TextStyle(fontSize: 16),
                  ),
                const  SizedBox(height: 10,),
                  Text(
                    thumbnailUrl,
                    style:const TextStyle(fontSize: 10),
                  ),
           ],),
         )
          ]),
        ),
      ),
    );
  }

