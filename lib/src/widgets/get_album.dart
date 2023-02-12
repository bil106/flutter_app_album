import 'package:flutter/material.dart';
import 'package:flutter_app/src/dataloader.dart';
import 'package:flutter_app/src/presentation/pages/photo_page.dart';
import 'package:flutter_app/src/theme/colors.dart';



List<Album>? albums;
Exception? exception;
bool isDescending = false;
int? id;

Widget getAlbums(BuildContext context, index) {
  final sortedAlbums = isDescending ? albums!.reversed.toList() : albums;
  final albumId = sortedAlbums![index].title;
  final id = 'id:${albums![index].id}';

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
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://source.unsplash.com/random?sig=$index'))),
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
                  style: const TextStyle(fontSize: 20),
                ),
                
                Text(
                  id.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                 
                ),
              ],
            ),
          )
        ]),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoPage(id: albums![index].id),
              ));
        },
      ),
    ),
  );
}
