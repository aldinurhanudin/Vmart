import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocsDetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String date;
  DocsDetailsPage(
      {required this.title,
      required this.image,
      required this.author,
      required this.date});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.bookmark_outline,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_outline,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.share_outlined,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: BottomAppBar(
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.headset,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.nights_stay_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.format_size_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ListView(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(image),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'T',
                        style: GoogleFonts.notoSerif(
                            color: Colors.black, fontSize: 32)),
                    TextSpan(
                      text:
                          ' ernyata, menikmati makanan yang kaya akan sayur-sayuran tidak hanya memberikan kelezatan bagi lidah kita, tetapi juga membawa manfaat luar biasa bagi kesehatan tubuh kita. Sayuran mengandung serat tinggi yang membantu menjaga pencernaan yang sehat, serta vitamin dan mineral yang diperlukan tubuh untuk berfungsi optimal. Selain itu, sayuran juga kaya akan antioksidan yang dapat melawan radikal bebas dan mengurangi risiko penyakit kronis seperti penyakit jantung, diabetes, dan kanker. Dengan mengonsumsi lebih banyak sayuran dalam pola makan sehari-hari, Anda dapat mengoptimalkan kesehatan Anda dan menjaga diri tetap bugar. Jadi, tidak ada alasan untuk tidak menyertakan sayuran dalam setiap hidangan Anda. Jadikanlah kebiasaan ini sebagai investasi terbaik bagi kesehatan jangka panjang Anda.',
                      style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontSize: 18,
                        height: 1.7,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
