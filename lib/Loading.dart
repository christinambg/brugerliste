import 'package:flutter/material.dart';
import 'package:brugerliste/main.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Loading Screen'),
            Image(
                image: AssetImage('assets/YourDrinkLogo.png'))
          ],
        ),

      ),
    );
  }
}
