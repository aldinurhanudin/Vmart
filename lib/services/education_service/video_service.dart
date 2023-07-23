

import 'package:vmart/models/education_model/video.dart';
import 'package:vmart/repository/education_repository/video_repository.dart';

class VideoService {
  final VideoRepository _videoRepository = VideoRepository();

  Future<List<Video>> fetchVideos() async {
    var response = await _videoRepository.fetchAllVideos();

    return List<Video>.from((response.data['items'])
        .map((json) => Video.fromJson(json['snippet'])));

 
  }
}
