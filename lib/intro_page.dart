import 'package:flutter/material.dart';
import 'package:ecommerce/my_button.dart';
import 'package:ecommerce/shop_page.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child:  Lottie.asset('assests/ani.json')
            ),// Corrected asset path
            SizedBox(height: 15),
            Text(
              "Sole Savvy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Savvy Choices, Perfect Fits", // Fixed typo in text
              style: TextStyle(color: Colors.black87,fontSize: 17),
            ),
            SizedBox(height: 25),
            MyButton(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPage()),
                );
              },
              child: Text("EXPLORE",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
