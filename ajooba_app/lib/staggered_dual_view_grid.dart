import 'package:flutter/material.dart';
import "veg.dart";

class MainStaggeredDualViewGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
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



