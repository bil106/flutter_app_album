import 'dart:convert' as convert ;

import 'package:http/http.dart' as http;


class Photo {
  int albumId=0;
   int id=0;
   String title='';
   String url='';
   String thumbnailUrl='';

//   Photo({
//      this.albumId,
//      this.id,
//      this.title,
//      this.url,
//      this.thumbnailUrl,
//   });

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       albumId: json['albumId'],
//       id: json['id'],
//       title: json['title'],
//       url: json['url'],
//       thumbnailUrl: json['thumbnailUrl'],
//     );
//   }
 }

Future<Photo> loadPhotos(int id) async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'));
late Photo photo;

  var item = convert.jsonDecode(response.body);
   
   photo = Photo();
   photo.albumId=item['albumId'];
   photo.id=item['id'];
   photo.title=item['title'];
   photo.url=item['url'];
   photo.thumbnailUrl=item['thumbnailUrl'];

  
  
  return photo;
}
