part of '../../widgets.dart';

class SpecialCategories extends StatelessWidget {
  const SpecialCategories({super.key});

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
            offset: const Offset(0, 2),
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
              'Spesial Buat Kamu!',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.asset(
                          'assets/best_deal.png',
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Penawaran\nTerbaik',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: defaultMargin,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.asset(
                          'assets/pilihan_vmart .png',
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Pilihan\nVmart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: defaultMargin,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.asset(
                          'assets/beli_banyak.png',
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Pilihan\nIrit',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: defaultMargin,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.asset(
                          'assets/discon.png',
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Diskon\nTerbaik',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: defaultMargin,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.asset(
                          'assets/beli_lagi.png',
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Beli\nLagi',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
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
