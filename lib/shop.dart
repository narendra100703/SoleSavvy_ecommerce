import 'package:ecommerce/product.dart';
import 'package:flutter/cupertino.dart';
 class Shop extends ChangeNotifier{
   final List<Product>_shop=[
     Product(name: "Nike Air Max 270", price:120,
         description: "Nike Air Max 270: Features a large Air Max unit for exceptional cushioning and a sleek, modern design.",
         imagePath: 'assests/1.jpg'),
     Product(name: "Gucci Ace Sneakers", price:90,
         description: "Gucci Ace Sneakers: Luxurious leather sneakers with the iconic Gucci stripe and embroidered details.",
         imagePath: 'assests/3.jpg'),
     Product(name: "Nike Air Force 1",
         price:650, description: "Nike Air Force 1: An iconic sneaker with a classic silhouette, and signature Air cushioning.",
         imagePath: 'assests/2.jpg'),
     Product(name: "New Balance 990v5",price:255,
         description: "New Balance 990v5: Premium running shoes offering superior comfort, stability, and timeless style.",imagePath: 'assests/4.jpg'),
     Product(name: "Puma Cali Sport", price:80,
         description: "Puma Cali Sport: Trendy sneakers featuring a bold, chunky sole and classic Puma styling.",
         imagePath: 'assests/5.jpg'),
     Product(name: "Vans Old Skool", price:50,
         description: "Vans Old Skool: Classic skate shoes with the iconic side stripe, durable canvas, and suede uppers.",
         imagePath: 'assests/6.jpg'),
     Product(name: "Gucci Screener Sneaker", price:199,
         description: "Gucci Screener Sneaker: Retro-inspired sneakers with vintage web stripes for a worn-in look.",
         imagePath: 'assests/7.jpg'),
   ];
   List<Product>_cart=[];
   List<Product>get shop=>_shop;
   List<Product>get cart=>_cart;
   void addToCart(Product item){
     _cart.add(item);
     notifyListeners();
   }

   void removeFromCart(Product item){
     _cart.remove(item);
     notifyListeners();
   }
 }