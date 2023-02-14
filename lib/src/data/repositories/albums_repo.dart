import 'package:flutter_app/src/common/http/api_client.dart';
import 'package:flutter_app/src/domain/models/album.dart';

class AlbumsRepository{
  final ApiClient client;
  
  AlbumsRepository(this.client);

  Future<List<AlbumData>> getAlbums() async {
    List<AlbumData> response = await client.getAlbums();
    return response;
  }

  Future<List<AlbumData>> getAlbumsByTitle(String title) async {
    List<AlbumData> response = await client.getAlbumsByTitle(title);
    return response;
  }
}