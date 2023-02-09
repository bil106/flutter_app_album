import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          caption: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
        fontFamily: 'Georgia'
      ),
      home: const HomePage(),
    );
  }
}

class FavoritWidget extends StatefulWidget {
  const FavoritWidget({super.key});

  @override
  _FavoritWidgetState createState() => _FavoritWidgetState();
}

class _FavoritWidgetState extends State<FavoritWidget> {
  late bool _isFavorited = false;
  int _favoritCount = 888999;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
        SizedBox(
            width: 40,
            child: Container(
              child: Text('$_favoritCount'),
            ))
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoritCount -= 1;
      } else {
        _isFavorited = true;
        _favoritCount += 1;
      }
    });
  }
}

class PersonWidget extends StatelessWidget {
  const PersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Япония,Старшая школа'),
      ),
      body: Container(
        child: _buldMainColumn(),
      ),
    );
  }

  Widget _buldMainColumn() => ListView(
        children: [
          _buildTopImage(),
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
  Widget _buildTopImage() => Container(
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
          children: const <Widget>[FavoritWidget()],
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
}
