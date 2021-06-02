import 'package:flutter/material.dart';

class VegItem {
  final String name;
  final String price;
  final String imagePath;

  const VegItem(this.name, this.price, this.imagePath);
}

const VegProdList = [
  VegItem("Tomato", "Rs. 25/kg", "images/tomato2.jpg"),
  VegItem("Broccoli", "Rs. 25/kg", "images/broccoli1.jpg"),
  VegItem("Carrot", "Rs. 35/kg", "images/carrot1.jpg"),
  VegItem("Brinjal", "Rs. 35/kg", "images/brinjal1.jpg"),
  VegItem("Potato", "Rs. 35/kg", "images/potato1.jpg"),
  VegItem("Capsicum(Yellow)", "Rs. 35/kg", "images/capsicum_yellow1.jpg"),
  VegItem("Capsicum(Green)", "Rs. 35/kg", "images/capsicum_green1.jpg"),
  VegItem("Okra", "Rs. 25/kg", "images/okra1.jpg"),
  VegItem("Cauliflower", "Rs. 25/kg", "images/cauliflower1.jpg"),
  VegItem("Chilli Green", "Rs. 35/kg", "images/chilli_green2.jpg"),
];

class MainStaggeredDualViewGrid extends StatelessWidget {
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
                'Vegetables',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StaggeredDualView(
                  aspectRatio: 0.7,
                  spacing: 25,
                  itemBuilder: (context, index) {
                    return VegItemList(
                      veg: VegProdList[index],
                    );
                  },
                  itemCount: VegProdList.length),
            )));
  }
}

class VegItemList extends StatelessWidget {
  final VegItem veg;
  const VegItemList({Key? key, required this.veg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                veg.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    veg.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    veg.price,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
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
