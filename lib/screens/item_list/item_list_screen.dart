import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/models/categories.dart';
import 'package:fruit_app/screens/components/product_container.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              buildAppBar(context),
              ListCategories(),
              SizedBox(
                height: kDefaultPadding,
              ),
              buildPopularItemsTitle(context),
              SizedBox(
                height: kDefaultPadding,
              ),
              buildProductList(),
            ],
          ),
          buildBottomBar()
        ]),
      ),
    );
  }

  Widget buildProductList() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: kDefaultPadding),
        child: new StaggeredGridView.countBuilder(
            //shrinkWrap: false,
            //primary: false,
            physics: BouncingScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: kDefaultPadding / 2,
            itemCount: categoryList[1].items.length,
            itemBuilder: (BuildContext context, int index) => ProductContainer(
                categoryIndex: 1,
                itemIndex: index,
                product: categoryList[1].items[index],
                bottomMargin: 80),
            staggeredTileBuilder: (int index) =>
                //new StaggeredTile.count(2, categoryList[1].items.length ~/ 2),
                //new StaggeredTile.count(2, index.isEven ? 2 : 1),
                //StaggeredTile.count(2, index.isEven ? 1.2 : 1.8),
                StaggeredTile.fit(2)),
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
            calculateTotalPrice(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Spacer(),
          Container(
              height: 40,
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16))),
              child: Row(
                children: [
                  Text(
                    "Cart",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  Icon(Icons.add_shopping_cart)
                ],
              ))
        ]),
      ),
    );
  }

  String calculateTotalPrice() {
    double total = 0;
    cartList.forEach((element) => total += element.price);
    return 'Total : \$${total}';
  }

  Widget buildPopularItemsTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Popular Items", style: Theme.of(context).textTheme.headline6),
          Spacer(),
          GestureDetector(
            onTap: () {
              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) => Container(
              //           height: 200,
              //           color: Colors.red,
              //         ));
            },
            child: IconButton(icon: Icon(Icons.sort), onPressed: null),
          )
        ],
      ),
    );
  }

  Container buildAppBar(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          Spacer(),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.card_travel), onPressed: () {}),
          SizedBox(width: kDefaultPadding / 2),
        ],
      ),
    );
  }
}

class ListCategories extends StatefulWidget {
  @override
  _ListCategoriesState createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ItemListScreen()));
              },
              child: Container(
                  margin: EdgeInsets.only(left: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? categoryList[index].color
                        : Colors.transparent,
                    border: Border.all(color: kThemeColor),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Text(categoryList[index].name)),
            );
          }),
    );
  }
}
