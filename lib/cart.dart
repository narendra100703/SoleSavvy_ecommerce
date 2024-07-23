import 'package:ecommerce/my_button.dart';
import 'package:ecommerce/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/shop.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  void removeItem(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  void payButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Connect to Your Payment Backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 12,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return Column(
                  children: [
                    ListTile(
                      tileColor: Colors.orange[50],
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Adjust padding as needed
                      leading: Image.asset(item.imagePath, width: 50, height: 50), // Display image on the left
                      title: Text(
                        item.name,
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.black87),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.deepOrangeAccent,
                        ),
                        onPressed: () => removeItem(context, item),
                      ),
                    ),
                    SizedBox(height: 10), // Add spacing between items
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyButton(
              onTap: () => payButton(context),
              child: Text(
                "Pay Now",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
