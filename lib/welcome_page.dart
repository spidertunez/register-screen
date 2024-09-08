import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
import 'cart_model.dart';
import 'cart_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        leading: Consumer<UserModel>(
          builder: (context, userModel, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: userModel.imageLink.isNotEmpty
                  ? CircleAvatar(
                backgroundImage: NetworkImage(userModel.imageLink),
                radius: 25,
              )
                  : CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 25,
                child: Icon(Icons.person, color: Colors.white),
              ),
            );
          },
        ),
        title: Consumer<UserModel>(
          builder: (context, userModel, child) {
            return Text(
              'Welcome, ${userModel.username}!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.black,size: 33,),
            onPressed: () {

            },
          ),
          Consumer<CartModel>(
            builder: (context, cartModel, child) {
              return IconButton(
                icon: Icon(Icons.shopping_cart,color: Colors.black,size: 33,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(width: 2),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<UserModel>(
          builder: (context, userModel, child) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'How are you today, ${userModel.username}!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Image.asset('assets/chair2.png'),
                  Text(
                    'Orange Comfortable chair ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 20,),


                  Consumer<CartModel>(
                    builder: (context, cartModel, child) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        cartModel.decrementCounter();
                                      },
                                    ),
                                    Text(
                                      ' ${cartModel.counter}',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        cartModel.incrementCounter();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              cartModel.addToCart(cartModel.counter);
                            },
                            icon: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.orange[600],
                            ),
                          ),
                        ],
                      );
                    },
                  ),


                  SizedBox(height: 40),
                  Text(
                    'Your Email is: ${userModel.email}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your Mobile Number is: ${userModel.number}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
