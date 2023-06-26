part of '../../pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget popularProductsTitle() {
      return Container(
        height: 85,
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
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Produk Populer',
                style: primaryTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Temukan penawaran terbaik\ndi Vmart!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      // fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllProductsPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: Text(
                        'Lihat Semua',
                        style: greenTextStyle.copyWith(
                          fontSize: 14,
                          // fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget recipeTitle() {
      return Container(
        height: 91,
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
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'Kumpulan Resep Untukmu',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllProductsPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Lihat Semua',
                      style: greenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Jawaban Dari Kata "Terserah"',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    // fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 3),
        height: 330,
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
          color: primaryColor,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 2,
              right: 130,
              top: 3,
              bottom: 40,
              child: Image.asset(
                'assets/spesial_hari_ini.png', // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
                // height: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 250),
                      Row(
                        children: productProvider.products
                            .take(6)
                            .map(
                              (product) => ClipRect(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  widthFactor: 1.0,
                                  child: ProductCard(product),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Produk Terbaru',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
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
                'Produk Terbaru',
                style: primaryTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: productProvider.products
                    .take(6)
                    .map(
                      (product) => ProductTile(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        CarouselMapWidget(),
        ChooseCategories(),
        popularProductsTitle(),
        popularProducts(),
        SpecialCategories(),
        newArrivals(),
        recipeTitle(),
        RecipePage(),
      ],
    );
  }
}
