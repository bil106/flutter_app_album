import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<List<Album>> loadAlbums() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

  var jsonResponse = json.decode(response.body);
  List<Album> albums = [];
  for (var u in jsonResponse) {
    Album album = Album(
      userId: u['userId'],
      id: u['id'],
      title: u['title'],
    );

    albums.add(album);
  }
  return albums;
}
