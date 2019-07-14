import 'package:flutter/material.dart';

class Products {
  List<Product> productList;

  Products({
    this.productList,
  });

  Products copyWith({List<Product> productList}) {
    return new Products(
      productList: productList ?? this.productList,
    );
  }

  Products.initialState() : productList = List.unmodifiable(<Product>[]);

  // static Products fromJson(dynamic json) => Products(
  //       productList: List<Product>.from(
  //           json["productList"].map((x) => Product.fromJson(x))),
  //     );

  factory Products.fromJson(Map<String, dynamic> json) => new Products(
        productList: new List<Product>.from(
            json["productList"].map((x) => Product.fromJson(x))),
      );

  // dynamic toJson() => {
  //       'productList':
  //           List<dynamic>.from(productList?.map((x) => x.toJson() ?? [])),
  //     };
  Map<String, dynamic> toJson() => {
        "productList":
            List<dynamic>.from(productList?.map((x) => x.toJson() ?? [])),
      };
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

  // static Product fromJson(dynamic json) => Product(
  //       id: json["id"],
  //       productName: json["productName"],
  //       price: json["price"],
  //       quantity: json["quantity"],
  //     );

  // dynamic toJson() => {
  //       "id": id,
  //       "productName": productName,
  //       "price": price,
  //       "quantity": quantity,
  //     };
  factory Product.fromJson(Map<String, dynamic> json) => new Product(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "price": price,
        "quantity": quantity,
      };
}
