import 'package:ecommerce_app/feature/product/domain/entity/get_favourite_entity.dart';

class GetFavouriteResponse extends GetFavouriteEntity {
  GetFavouriteResponse({super.status, super.count, super.data,this.message});
  String ? message;
  GetFavouriteResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
}

class Data extends FavouriteData {
  Data({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  Data.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}

class Brand extends FavouriteBrand {
  Brand({super.id, super.name, super.slug, super.image});

  Brand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class Category extends FavouriteCategory {
  Category({super.id, super.name, super.slug, super.image});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class Subcategory extends FavouriteSubcategory {
  Subcategory({super.id, super.name, super.slug, super.category});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
