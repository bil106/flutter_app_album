import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/http/photo_loader.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key, required this.id});
  static String routeName = '/photo_page';
  final int id;
  @override
  _PhotoPageState createState() => _PhotoPageState(id: id);
}

class _PhotoPageState extends State<PhotoPage> {
  _PhotoPageState({required this.id}) : super();

  int id;

  Photo? photo;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var photosLoad = await loadPhotos(id);
    setState(() {
      photo = photosLoad;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    final Photo? currentPhotos = photo;
    if (currentPhotos == null) {
      widget = const Center(
        child: Text('Please, wait ...'),
      );
    } else {
      widget = photosList(context, currentPhotos);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: const Text('Photo'),
        centerTitle: true,
      ),
      body: widget,
    );
  }

  Widget photosList(BuildContext context, Photo photos) {
    return ListView.builder(
        itemCount: photos.albumId,
        itemBuilder: (context, index) {
          final albumId = '${photos.albumId}  ${photos.title}';
          final thumbnailUrl = photos.thumbnailUrl;
          final albumImage = photos.url;

          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  albumImage.toString(),
                  width: double.infinity,
                ),
                const SizedBox(
                  width: 20,
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            albumId,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                            width: 5,
                          ),
                          Text(
                            thumbnailUrl.toString(),
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
