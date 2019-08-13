import 'package:basic_flutter/models/productState.dart';

class AddProduct {
  final Product product;

  AddProduct(this.product);
}

class DeleteProduct {
  final String id;

  DeleteProduct(this.id);
}

class ClearProductList {}
