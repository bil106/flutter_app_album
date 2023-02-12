import 'dart:convert' as convert ;
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

@JsonSerializable()
class Photo {
  late final int albumId;
  late final  int? id;
  late final String? title;
  late final String? url;
   late final String? thumbnailUrl;

  Photo({
   required  this.albumId,
   required  this.id,
   required this.title,
   required  this.url,
   required  this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
 }

Future<Photo> loadPhotos(int id) async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'));
late Photo photo;

  var item = convert.jsonDecode(response.body);
   
   photo = Photo(albumId: 0,id: 0,title: '',url: '',thumbnailUrl: '');
   photo.albumId=item['albumId'];
   photo.id=item['id'];
   photo.title=item['title'];
   photo.url=item['url'];
   photo.thumbnailUrl=item['thumbnailUrl'];

  
  
  return photo;
}
Future<List<Photo>> loadPhotosList() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/'));

  var jsonResponse = json.decode(response.body);
  List<Photo> photos = [];
  for (var u in jsonResponse) {
    Photo photo = Photo(
      albumId: u['albumId'],
      id: u['id'],
      title: u['title'],
      url: u['url'],
      thumbnailUrl: u['thumbnailUrl'],
    );

    photos.add(photo);
  }
  return photos;
}
