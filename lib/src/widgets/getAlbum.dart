


import 'package:flutter/material.dart';
import 'package:flutter_app/src/dataloader.dart';
import 'package:flutter_app/src/pages/photo_page.dart';
import 'package:flutter_app/src/photoLoader.dart';

import 'package:flutter_app/src/theme/colors.dart';
import 'package:flutter_app/src/widgets/getPhoto.dart';





 late List<Album>? albums = null;
  late Exception? exception = null;

int? id;
//late Photo? photo=Photo();


Widget getAlbums(BuildContext context, index) {
  
    final albumId = '${albums![index].userId}  ${albums![index].title}';
    // final thumbnailUrl=photo!.thumbnailUrl;
    // final albumImage =  photo!.url;
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
                image:const  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                     'https://img.freepik.com/free-vector/summer-holidays-frame_1284-5106.jpg?w=826&t=st=1676121736~exp=1676122336~hmac=56f90ffd200f64d5925d53f550fe987f8e6e839f945b187c1e4c23e21539d976'   
                      
                       ))
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
                  // Text(
                  //   'thumbnailUrl',
                  //   style:const TextStyle(fontSize: 10),
                  // ),
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

