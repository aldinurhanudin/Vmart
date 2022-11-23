class GalleryModel {
  int? id;
  var url;

  GalleryModel({
    this.id,
    this.url,
  });

  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}
