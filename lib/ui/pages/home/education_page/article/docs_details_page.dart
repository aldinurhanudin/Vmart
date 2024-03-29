import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmart/shared/shared.dart';

class DocsDetailPage extends StatefulWidget {
  final DocumentSnapshot data;

  const DocsDetailPage({required this.data});

  @override
  State<DocsDetailPage> createState() => _DocsDetailPageState();
}

class _DocsDetailPageState extends State<DocsDetailPage> {
  String truncateText(String text, int maxWords) {
    if (text == null || text.isEmpty) {
      return '';
    }

    List<String> words = text.split(' ');
    if (words.length <= maxWords) {
      return text;
    }

    String truncatedText = words.getRange(0, maxWords).join(' ');
    return '${truncatedText}...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          truncateText(widget.data['title'], 4),
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          ClipRRect(
            child: Container(
              child: IconButton(
                icon: Icon(
                  Icons.share_outlined,
                  size: 25,
                ),
                color: primaryColor,
                onPressed: () {},
              ),
            ),
          ),
          ClipRRect(
            child: Container(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25,
                ),
                color: primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.data['title']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.network(
                  '${widget.data['image']}',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '${widget.data['menjorok1']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '${widget.data['paragraf1']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '${widget.data['menjorok2']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '${widget.data['paragraf2']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Kategori',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                // height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  '${widget.data['kategori']}',
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
