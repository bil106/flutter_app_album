

import 'dart:convert';

import 'package:http/http.dart' as http;


class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
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

Future<List<Photo>> loadPhotos() async {
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
