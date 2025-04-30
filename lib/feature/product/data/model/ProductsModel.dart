

import 'package:ecommerce_app/feature/product/domain/entity/ProductsEntity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel({required super.results, required super.metadata, required super.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    results: json["results"],
    metadata: Metadata.fromJson(json["metadata"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );


}

class Datum extends DatumEntity {
  Datum({required super.sold, required super.images, required super.subcategory, required super.ratingsQuantity, required super.id, required super.title, required super.slug, required super.description, required super.quantity, required super.price, required super.imageCover, required super.category, required super.brand, required super.ratingsAverage, required super.createdAt, required super.updatedAt, required super.datumId, required super.priceAfterDiscount, required  super.availableColors});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    sold: json["sold"],
    images: List<String>.from(json["images"].map((x) => x)),
    subcategory: List<Brand>.from(json["subcategory"].map((x) => Brand.fromJson(x))),
    ratingsQuantity: json["ratingsQuantity"],
    id: json["_id"],
    title: json["title"],
    slug: json["slug"],
    description: json["description"],
    quantity: json["quantity"],
    price: json["price"],
    imageCover: json["imageCover"],
    category: Brand.fromJson(json["category"]),
    brand: Brand.fromJson(json["brand"]),
    ratingsAverage: json["ratingsAverage"]?.toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    datumId: json["id"],
    priceAfterDiscount: json["priceAfterDiscount"],
    availableColors: json["availableColors"] == null ? [] : List<dynamic>.from(json["availableColors"]!.map((x) => x)),
  );


}

class Brand extends BrandEntity {
  Brand({required super.id, required super.name, required super.slug, required super.image, required super.category });


  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    category: categoryValues.map[json["category"]]!,
  );



}



final categoryValues = EnumValues({
  "6439d2d167d9aa4ca970649f": Category.THE_6439_D2_D167_D9_AA4_CA970649_F,
  "6439d58a0049ad0b52b9003f": Category.THE_6439_D58_A0049_AD0_B52_B9003_F,
  "6439d5b90049ad0b52b90048": Category.THE_6439_D5_B90049_AD0_B52_B90048
});

class Metadata extends MetadataEntity {
  Metadata({required super.currentPage, required super.numberOfPages, required super.limit, required super.nextPage});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    currentPage: json["currentPage"],
    numberOfPages: json["numberOfPages"],
    limit: json["limit"],
    nextPage: json["nextPage"],
  );



}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
