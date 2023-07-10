part of '../models.dart';

class ProductModel {
  int? id;
  var name;
  int? price;
  var description;
  String? tags;
  var isAvailable;
  // StocksModel? stocks;
  int? totalStock;
  CategoryModel? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.isAvailable,
    // this.stocks,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.galleries,
    this.totalStock,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = int.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    isAvailable = json['is_available'];
    totalStock = json['totalStock'];
    // stocks = StocksModel.fromJson(json['stocks']);
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'is_available': isAvailable,
      // 'stocks': stocks?.toJson(),
      'totalStock': totalStock,
      'category': category?.toJson(),
      'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializedProductModel extends ProductModel {}
