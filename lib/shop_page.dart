import 'package:ecommerce/drawer.dart';
import 'package:ecommerce/intro_page.dart';
import 'package:ecommerce/prodcut_tile.dart';
import 'package:ecommerce/product.dart';
import 'package:ecommerce/shop.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/cart.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Shop Page",
            style: TextStyle(
              color: Colors.white, // Change text color
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent, // Change AppBar background color
        elevation: 12, // Adjust elevation if needed
        foregroundColor: Colors.white, // Change icon and text color
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            ),
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Icon(
                    Icons.person_pin_circle_outlined,
                    size: 72,
                    color: Colors.deepOrangeAccent, // Change DrawerHeader icon color
                  ),
                ),
                SizedBox(height: 25),
                MyList(
                  onTap: () => Navigator.pop(context),
                  icon: Icons.home,
                  text: "Home",
                  // Change List color
                ),
                MyList(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    );
                  },
                  icon: Icons.shopping_bag,
                  text: "Cart", // Change List color
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyList(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => IntroPage()),
                  );
                },
                icon: Icons.logout,
                text: "Exit", // Change List color
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          SizedBox(height: 25),
          Center(
            child: Text(
              "Experience Shopping Like Never Before – Discover, Select, and Enjoy!",
              style: TextStyle(
                color: Colors.black, // Change body text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 25), // Add spacing
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
