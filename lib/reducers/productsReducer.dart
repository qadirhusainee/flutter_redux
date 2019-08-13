import 'package:redux/redux.dart';
import 'package:basic_flutter/actions/productsActions.dart';
import 'package:basic_flutter/models/productState.dart';

final productsReducer = combineReducers<ProductState>([
  new TypedReducer<ProductState, AddProduct>(_addProduct),
  new TypedReducer<ProductState, DeleteProduct>(_deleteProduct),
  new TypedReducer<ProductState, ClearProductList>(_clearProductList),
]);

ProductState _addProduct(ProductState productState, AddProduct action) {
  return productState.copyWith(
      productList: productState.productList..add(action.product));
}

ProductState _deleteProduct(ProductState productState, DeleteProduct action) {
  return productState.copyWith(
      productList: productState.productList
          .where((product) => action.id != product.id)
          .toList());
}

ProductState _clearProductList(
    ProductState productState, ClearProductList action) {
  productState.productList = [];
  return productState;
}
