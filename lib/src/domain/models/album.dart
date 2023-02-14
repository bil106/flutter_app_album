import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable()
class AlbumData {
  final int? albumId;
  final int id;
  final String title;
  final String? url;
  final String? thumbnailUrl;

  AlbumData({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory AlbumData.fromJson(Map<String, dynamic> json) =>
      _$AlbumDataFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumDataToJson(this);
}
