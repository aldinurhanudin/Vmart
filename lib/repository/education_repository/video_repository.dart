import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:vmart/data_education/youtube_api/video.dart';

import '../../data_education/youtube_api/client.dart';


class VideoRepository {
 late Dio dio;
  VideoRepository(){
    dio = client();
  }
  Future<Response>
  fetchAllVideos() async {
  return await getYoutubeVideos(dio);
  }
}
