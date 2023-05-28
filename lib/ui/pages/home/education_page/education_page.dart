import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../../../controller/education_controller/video_notifier.dart';
import '../../../widgets/home_page/education_widget/docs_page.dart';
import '../../../widgets/home_page/education_widget/video_page.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<VideoNotifier>(context, listen: false).fetchVideos();
  }

  TabBarView _buildTabBarView() {
    return TabBarView(children: [
      VideoPage(),
      DocsPage(),
    ]);
  }

  TabBar _buildTabBar() {
    return TabBar(
        indicatorWeight: 5,
        indicatorColor: Colors.green,
        labelColor: Colors.green,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            icon: Icon(Icons.video_collection),
            child: Text('Videos'),
          ),
          Tab(
            icon: Icon(Icons.description),
            child: Text('News'),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (_, __) {
              return <Widget>[
                SliverAppBar(
                  title: Text('Edukasi', style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.white,
                  pinned: true,
                  floating: false,
                  snap: false,
                  leading: Image.asset('assets/VMART.png'),
                  expandedHeight: 300,
                  bottom: _buildTabBar(),
                  actions: [
                    IconButton(
                      onPressed: () => print('Map pressed'),
                      icon: Icon(
                        Icons.map,
                        color: Colors.black,
                      ),
                      highlightColor: Colors.blue,
                      splashColor: Colors.purple,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: Text('cart'),
                      onPressed: () => print('cart pressed'),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsets.symmetric(vertical: kToolbarHeight),
                      child: Image.asset('assets/VMART.png'),
                    ),
                  ),
                ),
              ];
            },
            body: _buildTabBarView(),
          )),
    );
 
  }
}