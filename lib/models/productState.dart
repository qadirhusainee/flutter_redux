import 'package:flutter/material.dart';

class ProductState {
  List<Product> productList;
  bool loading;

  ProductState({this.productList, this.loading});

  ProductState copyWith({List<Product> productList}) {
    return ProductState(
        productList: productList ?? this.productList,
        loading: loading ?? this.loading);
  }

  ProductState.initialState()
      : productList = List.unmodifiable(<Product>[]),
        loading = false;

  factory ProductState.fromJSON(Map<String, dynamic> json) => ProductState(
      productList: List<Product>.from(
          json["productList"].map((x) => Product.fromJSON(x))),
      loading: json['loading']);

  Map<String, dynamic> toJson() => {
        "productList": List<dynamic>.from(
            productList?.map((product) => product.toJson() ?? [])),
        "loading": this.loading
      };

  @override
  String toString() {
    return '{productList: $productList, loading: $loading}';
  }
}

class Product {
  String id;
  String productName;
  int price;
  int quantity;

  Product({
    @required this.id,
    @required this.productName,
    @required this.price,
    @required this.quantity,
  });

  Product copyWith({String productName, int price, int quantity}) {
    return new Product(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'productName': this.productName,
        'price': this.price,
        'quantity': this.quantity
      };

  factory Product.fromJSON(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        quantity: json["quantity"],
      );

  @override
  String toString() {
    return '{id: $id, productName: $productName, price: $price, quantity: $quantity }';
  }
}
