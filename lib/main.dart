import 'package:bloc_example/bloc/products_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final productsBloc = ProductsBloc();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: productsBloc.productCount,
            // initialData: initialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Text('Products (${snapshot.data ?? 0})');
            },
          ),
        ),
        body: StreamBuilder(
          stream: productsBloc.getProducts,
          builder: (_, AsyncSnapshot<List<String>> snapshot) {
            print(snapshot.data);

            final products = snapshot.data ?? [];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, i) {
                return ListTile(title: Text(products[i]));
              },
            );
          },
        ),
      ),
    );
  }
}
