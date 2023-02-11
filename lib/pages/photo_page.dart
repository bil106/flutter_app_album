import 'package:flutter/material.dart';
import 'package:flutter_app/photoLoader.dart';
import 'package:flutter_app/widgets/getPhoto.dart';

import '../widgets/exception.dart';

import '../widgets/loader.dart';

class PhotPage extends StatefulWidget {
  const PhotPage({required this.id}) : super();

  final int id;
  @override
  _PhotPageState createState() => _PhotPageState(id: id);
}

class _PhotPageState extends State<PhotPage> {
  _PhotPageState({required this.id}) : super();

  int id;

  Photo? photo;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var photosInfo = await loadPhotos(id);
    setState(() {
      photo = photosInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    final photo = this.photo;
    if (photo == null) {
      widget = const Center(
        child: Text('Please, wait ...'),
      );
    } else {
      widget = SafeArea(
          child: Column(
        children: [
          GestureDetector(
            child: Image.network(
              photo.url,
              width: double.infinity,
            ),
            onTap: () {},
          ),
          Text(photo.title),
        ],
      ));
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
}
