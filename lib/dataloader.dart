import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;


  Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

Future<List<Album>> loadAlbums() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/'));

  var jsonResponse = json.decode(response.body);
  List<Album> albums = [];
  for (var u in jsonResponse) {
    Album album = Album(
        albumId: u['albumId'], id: u['id'], title: u['title'],url: u['url'],
        thumbnailUrl: u['thumbnailUrl']);

    albums.add(album);
  }
  return albums;
}



