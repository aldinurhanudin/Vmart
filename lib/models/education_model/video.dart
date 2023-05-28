
import 'dart:convert';

class Video {
  String? id;
  String? title;
  String? description;
  String? thumbnail;
  String? publishedDate;

  Video.fromJson(Map<String, dynamic> json) {
    id = json['resourceId']['videoId'];
    title = json['title'];
    description = json['description'];
    publishedDate = json['publishedAt'];
    if (json['thumbnails'] != null && json['thumbnails']['maxres'] != null) {
      thumbnail = json['thumbnails']['maxres']['url'];
    } else {
      thumbnail = 'https://picsum.photos/id/237/200/300';
    }
  }
}
