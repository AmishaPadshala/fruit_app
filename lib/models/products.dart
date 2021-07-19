import 'package:flutter/material.dart';

class Product {
  final String id, name, description;
  final List<String> images;
  final double price, cost;
  final Color color;

  Product(
      {this.id,
      this.name,
      this.images,
      this.color,
      this.price,
      this.cost,
      this.description});
}
