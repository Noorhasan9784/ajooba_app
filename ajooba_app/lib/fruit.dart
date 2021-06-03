import 'package:ajooba_app/cart.dart';
import 'package:flutter/material.dart';

class fruitItem {
  final String name1;
  final String price1;
  final String imagePath1;

  const fruitItem(this.name1, this.price1, this.imagePath1);
}

const fruitProdList = [
  fruitItem("Mango", "Rs. 50/kg", "images/mangoes.jpg"),
  fruitItem("Grapes", "Rs. 100/kg", "images/grapes.jpg"),
  fruitItem("Watermelon", "Rs. 30/kg", "images/watermelon.jpg"),
  fruitItem("Pineapple", "Rs. 100/kg", "images/pineapple.jpg"),
  fruitItem("Strawberry", "Rs. 200/kg", "images/strawberry.jpg"),
  fruitItem("Pomegranate", "Rs. 70/kg", "images/pomegranate.jpg"),
  fruitItem("Orange", "Rs. 50/kg", "images/orange.jpg"),
  fruitItem("Blackgrapes", "Rs. 100/kg", "images/blackgrapes.jpg"),
  fruitItem("Banana", "Rs. 40/kg", "images/banana.jpg"),
  fruitItem("Kiwi", "Rs. 30/kg", "images/kiwi.jpg"),
];

class MainStaggeredDualViewGrid1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light(),
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Fruits',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StaggeredDualView(
                  aspectRatio: 0.7,
                  spacing: 25,
                  itemBuilder: (context, index) {
                    return fruitItemList(
                      fruit: fruitProdList[index],
                    );
                  },
                  itemCount: fruitProdList.length),
            )));
  }
}

class fruitItemList extends StatelessWidget {
  final fruitItem fruit;
  const fruitItemList({Key? key, required this.fruit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                fruit.imagePath1,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    fruit.name1,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    fruit.price1,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
                    },
                    color: Colors.green[900],
                    highlightColor: Colors.amber,
                    tooltip: "Add to Cart",

                    icon: Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class StaggeredDualView extends StatelessWidget {
  const StaggeredDualView({
    key,
    required this.itemBuilder,
    required this.itemCount,
    this.spacing = 0.0,
    this.aspectRatio = 0.5,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        return Transform.translate(
          offset: Offset(0.0, index.isOdd ? 50 : 0.0),
          child: this.itemBuilder(context, index),
        );
      },
      itemCount: this.itemCount,
    );
  }
}