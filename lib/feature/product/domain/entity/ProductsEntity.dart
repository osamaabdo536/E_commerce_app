class ProductsEntity {
  int results;
  MetadataEntity metadata;
  List<DatumEntity> data;

  ProductsEntity({
    required this.results,
    required this.metadata,
    required this.data,
  });

}

class DatumEntity {
  int sold;
  List<String> images;
  List<BrandEntity> subcategory;
  int ratingsQuantity;
  String id;
  String title;
  String slug;
  String description;
  int quantity;
  int price;
  String imageCover;
  BrandEntity category;
  BrandEntity brand;
  double ratingsAverage;
  DateTime createdAt;
  DateTime updatedAt;
  String datumId;
  int? priceAfterDiscount;
  List<dynamic>? availableColors;

  DatumEntity({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.datumId,
    this.priceAfterDiscount,
    this.availableColors,
  });

}

class BrandEntity {
  String id;
  String name;
  String slug;
  String? image;
  Category? category;

  BrandEntity({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
    this.category,
  });

}

enum Category {
  THE_6439_D2_D167_D9_AA4_CA970649_F,
  THE_6439_D58_A0049_AD0_B52_B9003_F,
  THE_6439_D5_B90049_AD0_B52_B90048
}

class MetadataEntity {
  int currentPage;
  int numberOfPages;
  int limit;
  int nextPage;

  MetadataEntity({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });

}
