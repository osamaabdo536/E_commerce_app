import 'package:ecommerce_app/feature/home/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({super.results, this.metadata, super.data, super.message});

  HomeModel.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  Metadata? metadata;
}

class Data extends DataEntity {
  Data({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class Metadata {
  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;
}
