import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vmart/ui/widgets/home_page/education_widget/docs_cell_widget.dart';
import 'package:vmart/ui/widgets/home_page/education_widget/docs_details_page.dart';

class Docs {
  final String title;
  final String image;
  final String author;
  final String date;

  Docs(
      {required this.title,
      required this.image,
      required this.author,
      required this.date});
}

class DocsPage extends StatelessWidget {
  // const DocsPage({super.key});
  final data = [
    Docs(
      image: 'assets/carousel_2.png',
      title: 'Manfaat Menyantap Sayuran: Mengoptimalkan Kesehatan Anda',
      author: 'John Johny',
      date: '25 Mar 2020',
    ),
    Docs(
      image: 'assets/carousel_2.png',
      title: 'Manfaat Sayur dan Buah untuk Tubuh',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
    Docs(
      image: 'assets/carousel_2.png',
      title: 'Mengapa Sayur-Sayuran Penting?',
      author: 'John Johny',
      date: '15 Mar 2020',
    ),
    Docs(
      image: 'assets/carousel_2.png',
      title: 'Jenis-Jenis Sayur-Sayuran dan Manfaatnya',
      author: 'John Johny',
      date: '11 Mar 2020',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final docs = data[index];
              return DocsCellWidget(
                title: docs.title,
                image: docs.image,
                author: docs.author,
                date: docs.date,
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DocsDetailsPage(
                        title: docs.title,
                        image: docs.image,
                        author: docs.author,
                        date: docs.date,
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => Divider(),
          ),
        ),
      ),
    );
  }
}
