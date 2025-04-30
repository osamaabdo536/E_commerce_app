import 'package:ecommerce_app/feature/product/domain/entity/AddToCartEntity.dart';

class AddToCartResponse extends AddToCartEntity {
  AddToCartResponse({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddToCartResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataToCartResponse.fromJson(json['data']) : null;
  }
}

class AddDataToCartResponse extends AddDataToCartEntity {
  AddDataToCartResponse({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddDataToCartResponse.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsToCartResponse.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductsToCartResponse extends AddProductsToCartEntity {
  AddProductsToCartResponse({super.count, super.id, super.product, super.price});

  AddProductsToCartResponse.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
