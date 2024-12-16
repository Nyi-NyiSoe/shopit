import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.sunny),
            onPressed: () {},
          )
        ],
        title: const Text('Shop It'),
      ),
      body: const Center(
        child: Text('Welcome to Shop It'),
      ),
    );
  }
}
