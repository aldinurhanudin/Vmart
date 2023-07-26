import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:provider/provider.dart';
import 'package:vmart/models/education_model/video.dart';
import 'package:vmart/ui/widgets/home_page/education_widget/video_widget/video_list_tile.dart';

import '../../../../../controller/education_controller/video_notifier.dart';



class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<VideoNotifier, List<Video>>(
      selector: (_, notifier) => notifier.videoList,
      builder: (_, videoList, __) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: videoList.length,
            itemBuilder: (_, index) => VideoListTile(
              videoList[index],
            ),
          ),
        );
      },
    );
  }
}
