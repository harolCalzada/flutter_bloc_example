import 'dart:async';

const PRODUCTS = ["Microfono", "Teclado", "Camara"];

class ProductsBloc {
  Stream<List<String>> get getProducts async* {
    final List<String> products = [];
    for (String product in PRODUCTS) {
      await Future.delayed(Duration(seconds: 2));
      products.add(product);
      yield products;
    }
  }

  final StreamController<int> _productsCount = StreamController<int>();
  Stream<int> get productCount => _productsCount.stream;

  ProductsBloc() {
    getProducts
        .listen((productstList) => _productsCount.add(productstList.length));
  }

  dispose() {
    _productsCount.close();
  }
}
