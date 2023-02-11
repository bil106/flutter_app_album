


import 'package:flutter/material.dart';
import 'package:flutter_app/dataloader.dart';
import 'package:flutter_app/pages/photo_page.dart';
import 'package:flutter_app/photoLoader.dart';

import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/widgets/getPhoto.dart';





 late List<Album>? albums = null;
  late Exception? exception = null;

int? id;
late Photo? photo=Photo();
Photo get photo => "Photo$id";

Widget getAlbums(BuildContext context, index) {
  
    final albumId = '${albums![index].userId}  ${albums![index].title}';
    // final thumbnailUrl=photo!.thumbnailUrl;
     final albumImage =  photo!.url;
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
                      albumImage.toString()    ))
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
                    'thumbnailUrl',
                    style:const TextStyle(fontSize: 10),
                  ),
           ],),
         )
          ]),
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PhotPage( id: albums![index].id),));
          }, 
          
        ),
      ),
    );
  }

