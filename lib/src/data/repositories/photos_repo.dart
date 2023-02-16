import 'package:flutter_app/src/common/http/api_client.dart';
import 'package:flutter_app/src/domain/models/album.dart';

class PhotoRepository {
  final ApiClient client;
  PhotoRepository(this.client);

  Future<List<AlbumData>> getPhotos(int albumId) async {
    List<AlbumData> response = await client.getPhotos(albumId);
    return response;
  }
}
