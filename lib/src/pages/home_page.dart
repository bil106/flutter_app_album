import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/photo_page.dart';
import 'package:flutter_app/src/theme/colors.dart';
import 'package:flutter_app/src/widgets/get_album.dart';

import '../dataloader.dart';
import '../widgets/exception.dart';
import '../common/http/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool albumsLoad = false;
  bool isDescending = false;
  late List<Album> albums = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      var albumsLoad = await loadAlbums();
      setState(() {
        albums = albumsLoad;
      });
    } on Exception catch (ex) {
      setState(() {
        exception = ex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    final List<Album> currentAlbums = albums;
    if (currentAlbums != null) {
      content = albumsList(context, currentAlbums);
    } else if (exception != null) {
      content = exceptionStub(context, exception!);
    } else {
      content = loader(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: const Text('Listing albums'),
        centerTitle: true,
      ),
      body: Column(children: [
        TextButton.icon(
          icon: const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.compare_arrows,
              size: 28,
            ),
          ),
          label: Text(
            isDescending ? 'Descending' : 'Ascending',
            style: const TextStyle(fontSize: 16),
          ),
          onPressed: () => setState(() => isDescending = !isDescending),
        ),
        Expanded(child: content)
      ]),
    );
  }

  Widget albumsList(BuildContext context, List<Album> albums) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final sortedAlbums = albums
            ..sort((album1, album2) => isDescending
                ? album2.title.compareTo(album1.title)
                : album1.title.compareTo(album2.title));
          final album = sortedAlbums[index].title;

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Row(children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(60 / 2),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://source.unsplash.com/random?sig=$index'))),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          album,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoPage(id: albums[index].id),
                      ));
                },
              ),
            ),
          );
        });
  }
}
