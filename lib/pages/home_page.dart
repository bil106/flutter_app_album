import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/getAlbums.dart';

import '../dataloader.dart';
import '../widgets/exception.dart';
import '../widgets/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool albumsLoad = false;

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
    final List<Album>? currentAlbums = albums;
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
      body: Center(
        child: content,
      ),
    );
  }

  Widget albumsList(BuildContext context, List<Album> albums) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return getAlbums(index);
        });
  }
}


