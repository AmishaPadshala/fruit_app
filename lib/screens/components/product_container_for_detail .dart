import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/models/categories.dart';
import 'package:fruit_app/models/products.dart';
import 'package:fruit_app/screens/item_detail/item_detail_screen.dart';

class ProductContainerForDetail extends StatelessWidget {
  final int itemIndex;
  final int categoryIndex;
  final Product product;
  final double bottomMargin;

  ProductContainerForDetail(
      {this.categoryIndex, this.itemIndex, this.product, this.bottomMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.25,
      height: MediaQuery.of(context).size.height * 0.1,
      margin: itemIndex == categoryList[categoryIndex].items.length - 1
          ? EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: bottomMargin)
          : EdgeInsets.only(left: kDefaultPadding),
      decoration: BoxDecoration(
          color: product.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemDetailScreen(
                          product: product,
                        )));
          },
          child: Container(
            margin: EdgeInsets.only(
                left: kDefaultPadding,
                right: 2.5 * kDefaultPadding,
                top: kDefaultPadding,
                bottom: kDefaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                    child: Hero(
                      tag: '${categoryList[1].id}${product.images[0]}',
                      child: Image(
                        image: AssetImage(product.images[0]),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(color: kTextLightColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        CartCounter(),
      ]),
    );
  }
}

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
        padding: EdgeInsets.all(kDefaultPadding / 3),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Icon(Icons.add, color: kThemeColor),
            ),
          ],
        ),
      ),
    );
  }
}
