import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/models/categories.dart';
import 'package:fruit_app/models/products.dart';
import 'package:fruit_app/screens/components/expandable_text.dart';
import 'package:fruit_app/screens/components/product_container_for_detail%20.dart';

class ItemDetailScreen extends StatelessWidget {
  final Product product;

  ItemDetailScreen({this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: product.color.withOpacity(0.3),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                buildAppBar(),
                Expanded(flex: 2, child: Container()),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16))),
                    child: Column(
                      children: [
                        buildProductNameTitle(context),
                        SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        buildCostAndPrice(context),
                        SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        buildProductDescription(),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        Text(
                          "Related Items",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        buildProductList(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            buildBottomBar()
          ],
        ),
      ),
    );
  }

  Positioned buildBottomBar() {
    return Positioned(
      bottom: kDefaultPadding,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding / 2),
        height: 60,
        decoration: BoxDecoration(
            color: kThemeColor2,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16))),
        child: Row(children: [
          Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Container(
              height: 40,
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16))),
              child: Icon(Icons.add_shopping_cart))
        ]),
      ),
    );
  }

  Widget buildProductList() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.5 * kDefaultPadding),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList[1].items.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductContainerForDetail(
                  categoryIndex: 1,
                  itemIndex: index,
                  product: categoryList[1].items[index],
                  bottomMargin: kDefaultPadding);
            }),
      ),
    );
  }

  SingleChildScrollView buildProductDescription() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpandableText(
            '${product.description}',
            trimLines: 3,
          ),
        ],
      ),
    );
  }

  Row buildCostAndPrice(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: '\$${product.price}',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kTextLightColor),
            children: <TextSpan>[
              TextSpan(
                  text: '/kg',
                  style: TextStyle(color: kTextLightColor, fontSize: 18)),
              TextSpan(text: '   '),
              TextSpan(
                  text: '\$${product.cost}',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: kTextLightColor,
                      fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: '/kg',
                        style: TextStyle(color: kTextLightColor, fontSize: 16))
                  ]),
            ],
          ),
        )
      ],
    );
  }

  Row buildProductNameTitle(BuildContext context) {
    return Row(
      children: [
        Text(
          product.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(),
        Container(
          width: 100,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          padding: EdgeInsets.only(
              left: kDefaultPadding / 3,
              right: kDefaultPadding / 3,
              top: 1,
              bottom: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.remove, color: kThemeColor),
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: kTextLightColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(Icons.add, color: kThemeColor),
              )
            ],
          ),
        )
      ],
    );
  }

  Container buildAppBar() {
    return Container(
      child: Row(
        children: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.card_travel),
              onPressed: () {}),
        ],
      ),
    );
  }
}
