import 'package:flutter/material.dart';

class Catalog {
  String name;
  String category;
  String imageAsset;
  int price;

  Catalog(
      {required this.name,
      required this.category,
      required this.price,
      required this.imageAsset});
}

List<String> catalogName = [
  'Tart Cake',
  'Bolu',
  'Mini Cake',
  'Gelato',
  'Garlic Bread',
  'Bun'
];

var catalogData = [
  Catalog(
      name: 'Tart Cake',
      category: 'Dessert',
      imageAsset: 'images/tart-cake.jpg',
      price: 149000),
  Catalog(
      name: 'Bolu',
      category: 'Dessert',
      imageAsset: 'images/bolu.jpg',
      price: 49000),
  Catalog(
      name: 'Mini Cake',
      category: 'Dessert',
      imageAsset: 'images/mini-cake.jpg',
      price: 24000),
  Catalog(
      name: 'Gelato',
      category: 'Dessert',
      imageAsset: 'images/gelato.jpeg',
      price: 28000),
  Catalog(
      name: 'Garlic Bread',
      category: 'Breakfast',
      imageAsset: 'images/garlic-bread.jpg',
      price: 18000),
  Catalog(
      name: 'Bun',
      category: 'Breakfast',
      imageAsset: 'images/bun.jpg',
      price: 8000),
];
