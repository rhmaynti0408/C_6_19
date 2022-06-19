import 'package:flutter/foundation.dart';
import 'package:Scarlett_Shop/models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: "p1",
      productName: "Freshy",
      oldPrice: 1399.99,
      price: 1299.99,
      imageUrl: "assets/images/a.png",
    ),
    Product(
      id: "p2",
      productName: "Jolly",
      oldPrice: 24899,
      price: 22500,
      imageUrl: "assets/images/b.png",
    ),
    Product(
      id: "p3",
      productName: "Shower-Coffee",
      oldPrice: 1200,
      price: 950,
      imageUrl: "assets/images/c.png",
    ),
    Product(
      id: "p4",
      productName: "Shower-Cucumber",
      oldPrice: 700,
      price: 629,
      imageUrl: "assets/images/d.png",
    ),
    Product(
      id: "p5",
      productName: "Shower Mango",
      oldPrice: 300,
      price: 199.99,
      imageUrl: "assets/images/e.png",
    ),
    Product(
      id: "p6",
      productName: "Shower Pome",
      oldPrice: 230,
      price: 299.99,
      imageUrl: "assets/images/f.png",
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) {
      return prod.id == id;
    });
  }

  void addProduct(Product newProduct) {
    _items.insert(0, newProduct);
    notifyListeners();
  }

  List<Product> get selectedFavorite {
    return _items.where((favProducts) {
      return favProducts.isFavorite;
    }).toList();
  }
}
