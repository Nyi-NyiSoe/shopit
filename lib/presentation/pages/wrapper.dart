import 'package:flutter/material.dart';
import 'package:shopit/presentation/pages/home_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;
  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const Center(child: Text('Cart')),
    const Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ]),
        ),
        appBar: AppBar(
          title: const Text('Shop It'),
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}