import 'package:flutter/material.dart';
import 'package:vmart/models/education_model/video.dart';
import 'package:vmart/services/education_service/video_service.dart';


class VideoNotifier extends ChangeNotifier {
  List<Video> _videoList = [];
  List<Video> get videoList => _videoList;

  final VideoService _videoService = VideoService();

  Future<void> fetchVideos() async {
    _videoList = await _videoService.fetchVideos();
    notifyListeners();
  }
}
