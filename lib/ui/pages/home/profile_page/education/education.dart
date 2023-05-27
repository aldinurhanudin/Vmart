part of '../../../pages.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Edukasi',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 95),
                  child: Text(
                    'Selamat datang di Edukasi ',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 29),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      HomeTipsItem(
                        imageUrl: 'assets/img_tips1.png',
                        title: 'Best tips for using a credit card',
                        url: 'https://www.google.com',
                      ),
                      HomeTipsItem(
                        imageUrl: 'assets/img_tips2.png',
                        title: 'Spot the good pie of finance model ',
                        url: 'https://pub.dev/',
                      ),
                      HomeTipsItem(
                        imageUrl: 'assets/img_tips3.png',
                        title: 'Great hack to get better advices',
                        url:
                            // 'https://www.google.com',
                            'https://app.sandbox.midtrans.com/snap/v3/redirection/8527b81c-1023-44c6-9b92-e84d86c182b8',
                      ),
                      HomeTipsItem(
                        imageUrl: 'assets/img_tips4.png',
                        title: 'Save more penny buy this instead',
                        url: 'https://www.google.com',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
