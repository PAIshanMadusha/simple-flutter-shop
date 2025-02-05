import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_shop/pages/product_page.dart';
import 'package:simple_flutter_shop/providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}
