import 'package:ecommerce/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/shop.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  void addCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Add this item to your cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white, // Changed background color to white for better contrast
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(15.0), // Reduced padding for better fit
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange[50], // Light orange background for image container
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 15.0), // Adjusted spacing
              Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Slightly smaller font size
                ),
              ),
              SizedBox(height: 5.0), // Adjusted spacing
              Text(
                product.description,
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
          SizedBox(height: 15.0), // Adjusted spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent, // Orange background for button
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: IconButton(
                  onPressed: () => addCart(context),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white, // White icon for contrast
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
