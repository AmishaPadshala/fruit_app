import 'package:flutter/material.dart';
import 'package:fruit_app/models/products.dart';

class Category {
  final String id, name, image;
  final Color color;
  final List<Product> items;
  Category({this.id, this.name, this.image, this.color, this.items});
}

List<Product> cartList = [];
List<Product> favouriteList = [];

final List<Category> categoryList = [
  Category(
      id: "1",
      name: "Bakery",
      image: "assets/images/bakery.png",
      color: Colors.yellow.withOpacity(0.3),
      items: []),
  Category(
      id: "2",
      name: "Fruits",
      image: "assets/images/fruits.png",
      color: Colors.blue.withOpacity(0.3),
      items: [
        Product(
            id: "1",
            name: "Apple",
            images: [
              "assets/images/apple.png",
              "assets/images/apple.png",
              "assets/images/apple.png"
            ],
            color: Colors.orange.withOpacity(0.3),
            price: 3.25,
            cost: 4.5,
            description:
                "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy. However, entrepreneurs and marketers alike are susceptible to a common mistake that comes up when writing product descriptions. Even professional copywriters make it sometimes: writing product descriptions that simply describe your products."),
        Product(
            id: "2",
            name: "Grapes",
            images: [
              "assets/images/grapes.png",
              "assets/images/grapes.png",
              "assets/images/grapes.png"
            ],
            color: Colors.blue.withOpacity(0.3),
            price: 2.50,
            cost: 3.25,
            description:
                "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy. However, entrepreneurs and marketers alike are susceptible to a common mistake that comes up when writing product descriptions. Even professional copywriters make it sometimes: writing product descriptions that simply describe your products."),
        Product(
            id: "3",
            name: "Straberry",
            images: [
              "assets/images/straberry.png",
              "assets/images/straberry.png",
              "assets/images/straberry.png"
            ],
            color: Colors.green.withOpacity(0.3),
            price: 3.45,
            cost: 4.25,
            description:
                "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy. However, entrepreneurs and marketers alike are susceptible to a common mistake that comes up when writing product descriptions. Even professional copywriters make it sometimes: writing product descriptions that simply describe your products."),
        Product(
            id: "4",
            name: "Avocado",
            images: [
              "assets/images/avocado.png",
              "assets/images/avocado.png",
              "assets/images/avocado.png"
            ],
            color: Colors.purple.withOpacity(0.3),
            price: 3.25,
            cost: 4.5,
            description:
                "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy. However, entrepreneurs and marketers alike are susceptible to a common mistake that comes up when writing product descriptions. Even professional copywriters make it sometimes: writing product descriptions that simply describe your products."),
        Product(
            id: "5",
            name: "Cabbage",
            images: [
              "assets/images/cabbage.png",
              "assets/images/cabbage.png",
              "assets/images/cabbage.png"
            ],
            color: Colors.yellow.withOpacity(0.3),
            price: 3.25,
            cost: 4.5,
            description:
                "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy. However, entrepreneurs and marketers alike are susceptible to a common mistake that comes up when writing product descriptions. Even professional copywriters make it sometimes: writing product descriptions that simply describe your products."),
        Product(
            id: "6",
            name: "papaya",
            images: [
              "assets/images/papaya.png",
              "assets/images/papaya.png",
              "assets/images/papaya.png"
            ],
            color: Colors.yellow.withOpacity(0.3),
            price: 3.25,
            cost: 4.5,
            description:
                "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy. However, entrepreneurs and marketers alike are susceptible to a common mistake that comes up when writing product descriptions. Even professional copywriters make it sometimes: writing product descriptions that simply describe your products."),
        Product(
            id: "7",
            name: "Banana",
            images: [
              "assets/images/banana.png",
              "assets/images/banana.png",
              "assets/images/banana.png"
            ],
            color: Colors.purple.withOpacity(0.3),
            price: 3.25,
            cost: 4.5,
            description:
                "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy. However, entrepreneurs and marketers alike are susceptible to a common mistake that comes up when writing product descriptions. Even professional copywriters make it sometimes: writing product descriptions that simply describe your products."),
      ]),
  Category(
      id: "3",
      name: "Vegetables",
      image: "assets/images/vegetable.png",
      color: Colors.green.withOpacity(0.3),
      items: []),
  Category(
      id: "4",
      name: "Drinks",
      image: "assets/images/drinks.png",
      color: Colors.orange.withOpacity(0.3),
      items: []),
  Category(
      id: "5",
      name: "Chocklate",
      image: "assets/images/chocklate.png",
      color: Colors.black.withOpacity(0.3),
      items: []),
];
