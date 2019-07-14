import 'package:redux/redux.dart';
import 'package:basic_flutter/actions/productsActions.dart';
import 'package:basic_flutter/models/productState.dart';

final productsReducer = combineReducers<Products>([
  new TypedReducer<Products, AddProduct>(_addProduct),
  new TypedReducer<Products, DeleteProduct>(_deleteProduct),
  new TypedReducer<Products, DeleteAllProducts>(_deleteAllProducts),
]);

Products _addProduct(Products products, AddProduct action) {
  Products newProducts = products;
  newProducts.productList = products.productList..add(action.product);
  return newProducts;
}

Products _deleteProduct(Products products, DeleteProduct action) {
  Products newProducts = products;
  newProducts.productList =
      products.productList.where((product) => action.id != product.id).toList();
  return newProducts;
}

Products _deleteAllProducts(Products products, DeleteAllProducts action) {
  products.productList = [];
  return products;
}
