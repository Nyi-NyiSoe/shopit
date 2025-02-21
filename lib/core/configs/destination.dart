import 'package:flutter/material.dart';

class Destination {
  final String name;
  final IconData icon;
  const Destination(this.name, this.icon);

}

const List<Destination> destinations = <Destination>[
  Destination('Home', Icons.home),
  Destination('Cart', Icons.shopping_cart),
  Destination('Profile', Icons.person),
];