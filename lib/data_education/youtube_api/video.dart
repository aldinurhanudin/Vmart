import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

Future<Response> getYoutubeVideos(Dio client) async {
  final jsonString = await rootBundle.loadString('secrets.json');
  final data = json.decode(jsonString);

  String apiKey = data['api_key'];

  return client.get('/playlistItems', queryParameters: {
    'key': apiKey,
    'playlistId': 'PLMeOZcjPsiTTHgm5j_EMALv5EQrVpJuLP',
    'part': 'snippet',
    'maxResults': 50,
  });
}
