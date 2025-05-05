class GetFavouriteEntity {
  GetFavouriteEntity({
      this.status, 
      this.count, 
      this.data,});

  String? status;
  int? count;
  List<FavouriteData>? data;

}

class FavouriteData {
  FavouriteData({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
});

  int? sold;
  List<String>? images;
  List<FavouriteSubcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  FavouriteCategory? category;
  FavouriteBrand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;

}

class FavouriteBrand {
  FavouriteBrand({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;

}

class FavouriteCategory {
  FavouriteCategory({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;

}

class FavouriteSubcategory {
  FavouriteSubcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;

}