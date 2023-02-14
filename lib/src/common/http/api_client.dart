import 'package:dio/dio.dart';
import 'package:flutter_app/src/common/constants/api_constants.dart';
import 'package:flutter_app/src/domain/models/album.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

class Apis{
  static const String albums = '/albums';
  static const String album = '/albums/{id}';
  static const String titleSearch = '/albums?title={title}';
  static const String photos = '/albums/{id}/photos';

}

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.albums)
  Future<List<AlbumData>> getAlbums();

  @GET(Apis.album)
  Future<AlbumData> getAlbum(@Path("id") int albumId);

  @GET(Apis.titleSearch)
  Future<List<AlbumData>> getAlbumsByTitle(@Path("title") String title);

  @GET(Apis.photos)
  Future<List<AlbumData>> getPhotos(@Path("id") int albumId);
}


