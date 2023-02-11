import 'package:flutter/material.dart';
import 'package:flutter_app/src/photoLoader.dart';
import 'package:flutter_app/src/widgets/getPhoto.dart';





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
    var photosLoad = await loadPhotosList();
    setState(() {
      photos = photosLoad;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    final List<Photo>? currentPhotos = photos;
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
   Widget photosList(BuildContext context, List<Photo> photos) {
    return ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return getPhotos(context,index);
        });
  }
}
// SafeArea(
//           child: Column(
//         children: [
//           GestureDetector(
//             child: Image.network(
//               photo.url,
//               width: double.infinity,
//             ),
//             onTap: () {},
//           ),
//           Text(photo.title),
//         ],
//       ));