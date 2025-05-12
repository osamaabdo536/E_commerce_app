class ProductsEntity {
  int? results;
 // MetadataEntity? metadata;
  List<DatumEntity>? data;

  ProductsEntity({
    this.results,
   // this.metadata,
    this.data,
  });
}

class DatumEntity {
  int? sold;
  List<String>? images;
  List<BrandEntity>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  BrandEntity? category;
  //BrandEntity? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? datumId;
  int? priceAfterDiscount;
  List<dynamic>? availableColors;

  DatumEntity({
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
    //this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.datumId,
    this.priceAfterDiscount,
    this.availableColors,
  });
}

class BrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;
  Category? category;

  BrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.category,
  });
}

enum Category {
  THE_6439_D2_D167_D9_AA4_CA970649_F,
  THE_6439_D58_A0049_AD0_B52_B9003_F,
  THE_6439_D5_B90049_AD0_B52_B90048,
}

class MetadataEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });
}
