import 'package:ajooba_app/veg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MainStaggeredDualViewGrid m = new MainStaggeredDualViewGrid();
  Widget build(BuildContext context) {
  /*  Widget rollOverImageSection = Container(
      child: Column(
        children: [
          Expanded(
              child: Image(
                image: AssetImage('images/_cut_veg_01.jpg'),
              ),
          ),
        ],
      ),

    );*/
// The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
// The List.generate() constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
    List<Container> _buildGridTileList(int count) => List.generate(
    count, (i) => Container(
      decoration: BoxDecoration(
        border: Border.all(width: 15, color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),

      ),

          child: Image.asset(
              'images/pic$i.jpg',
            fit: BoxFit.fitHeight

          ),


    )
    );

    Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 250,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(6));


    return MaterialApp(
        //darkTheme: ThemeData.dark(),
        //themeMode: ThemeMode.dark,

        home: DefaultTabController(
          length: 4,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                  tabs: [
                    Image(
                      image: AssetImage('images/home1.png'),
                      height: 35,
                    ),
                    Image(
                      image: AssetImage('images/veg1.png'),
                      height: 40,
                    ),
                    Image(
                      image: AssetImage('images/fruit2.png'),
                      height: 40,
                    ),

                    Image(
                      image: AssetImage('images/grocery2.png'),
                      height: 40,
                    ),
                  ],

                ),

              ),
               drawer: Drawer(

                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const <Widget>[
                    DrawerHeader(
                      child: Text(
                        'Menu',
                        /*style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),*/
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Account'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Location'),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart_outlined),
                      title: Text('Shop by Category'),
                    ),
                    ListTile(
                      leading: Icon(Icons.summarize_sharp),
                      title: Text('Orders'),
                    ),
                  ],
                ),
              ),
            body: TabBarView(
              children: [
                _buildGrid(),
                m.build(context),
                //Icon(Icons.food_bank_outlined),
                Icon(Icons.shop),
                Icon(Icons.shopping_cart),
              ],
            ),
             ),
        )
    );
  }
}
