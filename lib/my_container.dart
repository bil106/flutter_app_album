import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container')),
      body: Container(
        width: 900,
        height: 900,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(
                    'https://cdn.pixabay.com/photo/2021/07/24/15/47/venice-6489813_960_720.jpg')
                .image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
