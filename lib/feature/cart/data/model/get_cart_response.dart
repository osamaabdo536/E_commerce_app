import 'package:ecommerce_app/feature/cart/domain/entity/get_cart_entity.dart';

class GetCartResponse extends GetCartEntity {
  GetCartResponse({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
    this.message
  });
  String? message;
  GetCartResponse.fromJson(dynamic json) {
    status = json['status'];
    status = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data extends GetCartData {
  Data({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class Products extends GetCartProducts {
  Products({super.count, super.id, super.product, super.price});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }
}

class Product extends GetCartProduct {
  Product({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}

class Brand extends GetCartBrand {
  Brand({super.id, super.name, super.slug, super.image});

  Brand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class Category extends GetCartCategory {
  Category({super.id, super.name, super.slug, super.image});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class Subcategory extends GetCartSubcategory {
  Subcategory({super.id, super.name, super.slug, super.category});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
