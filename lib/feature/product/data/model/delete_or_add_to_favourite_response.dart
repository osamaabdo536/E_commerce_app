import 'package:ecommerce_app/feature/product/domain/entity/delete_or_add_to_favourite_entity.dart';

class DeleteOrAddToFavouriteResponse extends DeleteOrAddToFavouriteEntity {
  DeleteOrAddToFavouriteResponse({super.status, super.message, super.data});

  DeleteOrAddToFavouriteResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
