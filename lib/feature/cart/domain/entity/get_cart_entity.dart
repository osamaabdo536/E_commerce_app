class GetCartEntity {
  GetCartEntity({this.status, this.numOfCartItems, this.cartId, this.data});

  String? status;
  int? numOfCartItems;
  String? cartId;
  GetCartData? data;
}

class GetCartData {
  GetCartData({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<GetCartProducts>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

class GetCartProducts {
  GetCartProducts({this.count, this.id, this.product, this.price});

  int? count;
  String? id;
  GetCartProduct? product;
  int? price;
}

class GetCartProduct {
  GetCartProduct({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<GetCartSubcategory>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  GetCartCategory? category;
  GetCartBrand? brand;
  double? ratingsAverage;
}

class GetCartBrand {
  GetCartBrand({this.id, this.name, this.slug, this.image});

  String? id;
  String? name;
  String? slug;
  String? image;
}

class GetCartCategory {
  GetCartCategory({this.id, this.name, this.slug, this.image});

  String? id;
  String? name;
  String? slug;
  String? image;
}

class GetCartSubcategory {
  GetCartSubcategory({this.id, this.name, this.slug, this.category});

  String? id;
  String? name;
  String? slug;
  String? category;
}
