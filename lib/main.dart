import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';

import 'dataloader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBar',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 22.0, color: Colors.white),
          ),
          fontFamily: 'Georgia'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Album>? albums = null;
  late Exception? exception = null;

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
  void initState() {
    super.initState();
    loadData();
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
      body: Center(child: content),
    );
  }
}

Widget albumsList(BuildContext context, List<Album> albums) {
  return Flexible(
    child: ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) => Row(
        children: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.photo_album)),
         
          Text('${albums[index].id}${' '}${albums[index].title}' ,style: const TextStyle(fontSize: 24) ,),
        ],
      ),
    ),
  );
}

Widget loader(
  BuildContext context,
) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Text(
      'Loading data ...',
      style: Theme.of(context).textTheme.headlineMedium,
    ),
  ]);
}

Widget exceptionStub(BuildContext context, Exception exception) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Text(
      'Ooops! Error is ${exception.toString()}',
      style: Theme.of(context).textTheme.headlineMedium,
    ),
  ]);
}
 /* Widget _buldMainColumn(BuildContext context, List<Album> albums) => ListView(
        children: [
          _loadData(),
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2),
                    child: _buildRating(),
                  ),
                  Card(
                    margin: const EdgeInsets.all(5),
                    elevation: 5,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: _buildActiom()),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildDesc(),
                  )
                ],
              ),
            ),
          )
        ],
      );
  Widget _loadData() => Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 1),
        child: Card(
          elevation: 5,
          child: Image.asset(
            'assets/images/lake-5848868_960_720.jpg',
            height: 450,
            width: 700,
            fit: BoxFit.none,
          ),
        ),
      );

  Widget _buildRating() => ListTile(
        title: const Text('name',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
        subtitle: const Text('Japan'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[MyHomePage()],
        ),
      );

  Widget _buildActiom() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButton('Desc1', Icons.star, Colors.black),
          _buildButton('Desc2', Icons.radio_button_checked, Colors.green),
          _buildButton('Desc3', Icons.school, Colors.red),
        ],
      );

  Widget _buildButton(String label, IconData icon, Color color) => Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
          ),
          Container(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
  Widget _buildDesc() => const Text(
        'Текст описания',
        softWrap: true,
        style: TextStyle(
          fontSize: 18.0,
        ),
      );
*/
