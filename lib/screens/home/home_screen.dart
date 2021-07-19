import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/models/categories.dart';
import 'package:fruit_app/screens/components/product_container.dart';
import 'package:fruit_app/screens/item_list/item_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildOfferContainer(context),
          SizedBox(
            height: kDefaultPadding,
          ),
          buildCategoryTitle(context),
          SizedBox(
            height: kDefaultPadding,
          ),
          listCategories(context),
          SizedBox(
            height: kDefaultPadding,
          ),
          buildTopProductsTitle(context),
          SizedBox(
            height: kDefaultPadding,
          ),
          buildProductList(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.red,
        child: TextButton(onPressed: () {}, child: Text("fdsaf")),
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
            return ProductContainer(
                categoryIndex: 1,
                itemIndex: index,
                product: categoryList[1].items[index],
                bottomMargin: 0);
          }),
    ));
  }

  Widget buildTopProductsTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Top Products", style: Theme.of(context).textTheme.headline6),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: kThemeColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: TextButton(
                  child: Text("Explore All"),
                )),
          )
        ],
      ),
    );
  }

  Widget listCategories(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ItemListScreen()));
              },
              child: Container(
                margin: index == categoryList.length - 1
                    ? EdgeInsets.symmetric(horizontal: kDefaultPadding)
                    : EdgeInsets.only(left: kDefaultPadding),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          color: categoryList[index].color,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Image(
                          image: AssetImage(categoryList[index].image),
                        ),
                      ),
                    ),
                    Text(categoryList[index].name)
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildCategoryTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Categories", style: Theme.of(context).textTheme.headline6),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemListScreen()));
            },
            child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: kThemeColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: TextButton(
                  child: Text("Explore All"),
                )),
          )
        ],
      ),
    );
  }

  Widget buildOfferContainer(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        margin: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
        decoration: BoxDecoration(
            color: kThemeColor,
            borderRadius: BorderRadius.all(Radius.circular(16))));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: kThemeColor),
      leading: IconButton(icon: Icon(Icons.more), onPressed: () {}),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: Icon(Icons.card_travel), onPressed: () {})
      ],
    );
  }
}
