import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart'; // Import the UserModel class
import 'cart_model.dart'; // Import the CartModel class
import 'register_page.dart'; // Import the RegisterPage class
import 'welcome_page.dart'; // Import the WelcomePage class

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()), // Provide UserModel
        ChangeNotifierProvider(create: (context) => CartModel()), // Provide CartModel
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => RegisterPage(),
        '/welcome': (context) => WelcomePage(),
      },
    );
  }
}
