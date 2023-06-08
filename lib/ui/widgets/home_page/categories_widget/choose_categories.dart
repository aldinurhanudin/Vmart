part of '../../widgets.dart';

class ChooseCategories extends StatelessWidget {
  const ChooseCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: 170,

      margin: EdgeInsets.only(
        top: 14,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        // borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilihan Kategori',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/semua_kategori.png',
                            fit: BoxFit.cover,
                            height: 90,
                            width: 90,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Semua Kategori ',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: medium,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: defaultMargin,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/kategori_sayur_segar.png',
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Sayur Segar',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: defaultMargin,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/kategori_buah_segar.png',
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Buah Segar ',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: defaultMargin,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/kategori_buah_segar.png',
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Buah Segar ',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
