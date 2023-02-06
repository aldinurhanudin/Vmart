part of '../../pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // Widget build(BuildContext context) {
  //   AuthProvider authProvider = Provider.of<AuthProvider>(context);
  //   UserModel user = authProvider.user;
  //   return ListView(
  //     children: [
  //       HeaderHomePage(),
  //       Categories(),
  //       PopularProductsTitle(),
  //       PopularProducts(),
  //       NewArrivalsTitle(),
  //       NewArrivals(),
  //     ],
  //   );
  // }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    int currentIndex = 0;
    CarouselController carouselController = CarouselController();
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    user.profilePhotoUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget carousel() {
      return Container(
        child: CarouselSlider(
          items: [
            Container(
              width: 360,
              height: 205,
              margin: const EdgeInsets.only(
                bottom: 1,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              decoration: BoxDecoration(
                // color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/carousel_home.png',
                height: 203,
                width: 400,
              ),
            ),
            Container(
              width: 360,
              height: 205,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/welcome.png',
                height: 203,
                width: 268,
              ),
            ),
            Container(
              width: 360,
              height: 205,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/welcome.png',
                height: 203,
                width: 268,
              ),
            ),
            Container(
              width: 360,
              height: 205,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/welcome.png',

                // height: 203,
                // width: 268,
              ),
            ),
            Container(
              width: 360,
              height: 205,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/welcome.png',
                // height: 203,
                // width: 268,
              ),
            ),
            Container(
              width: 360,
              height: 205,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/welcome.png',
                // height: 203,
                // width: 268,
              ),
            ),
          ],
          options: CarouselOptions(
              height: 204,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
          carouselController: carouselController,
        ),
      );
    }

    Widget categoriesTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Pilihan Kategori',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'Semua Produk',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Sayur Segar',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Buah Segar',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Daging',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Produk Populer',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCard(product),
                    )
                    .toList(),
              ),
            ],
          ),
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
        child: Column(
          children: productProvider.products
              .map(
                (product) => ProductTile(product),
              )
              .toList(),
          // children: [
          //   ProductTile(),
          //   ProductTile(),
          //   ProductTile(),
          //   ProductTile(),
          // ],
        ),
      );
    }

    Widget buildTips() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kumpulan Tips Untukmu',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Wrap(
              spacing: 17,
              runSpacing: 18,
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
                  url: 'https://www.google.com',
                ),
                HomeTipsItem(
                  imageUrl: 'assets/img_tips4.png',
                  title: 'Save more penny buy this instead',
                  url: 'https://www.google.com',
                ),
              ],
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        // Container(
        //   padding: EdgeInsets.only(
        //       left: 20, right: 20, top: SizeApps.height(context, size: 0.055)),
        //   height: SizeApps.height(context, size: 0.2),
        //   width: SizeApps.width(context, size: 1),
        //   decoration: const BoxDecoration(color: mainColor),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           SizedBox(
        //             height: SizeApps.width(context, size: 0.08),
        //             width: SizeApps.width(context, size: 0.08),
        //             child: ClipRRect(
        //                 borderRadius: BorderRadius.circular(100.0),
        //                 child: CachedNetworkImage(
        //                     imageUrl: "Image",
        //                     fit: BoxFit.cover,
        //                     alignment: Alignment.center,
        //                     httpHeaders: {
        //                       // "authorization" : "Bearer ${controller.tokenAccess}",
        //                       // "x-authorization" : "${controller.token}",
        //                       // "Content-Type" : "image/*"
        //                     },
        //                     placeholder: (context, url) => Image.asset(
        //                           'assets/no_profile.png',
        //                           fit: BoxFit.cover,
        //                         ),
        //                     errorWidget: (context, url, error) {
        //                       return Image.asset(
        //                         'assets/no_profile.png',
        //                         fit: BoxFit.cover,
        //                       );
        //                     })),
        //           ),
        //           const SizedBox(
        //             width: 8,
        //           ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               // controller.profileData == null ?
        //               ShimmerLine(width: SizeApps.width(context, size: 0.3)),
        //               Text(
        //                 "",
        //                 // controller.profileData!.NAME,
        //                 overflow: TextOverflow.ellipsis,
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: SizeApps.width(context, size: 0.035)),
        //               ),
        //               const SizedBox(
        //                 height: 3,
        //               ),
        //               // controller.profileData == null ?
        //               ShimmerLine(width: SizeApps.width(context, size: 0.2)),
        //               Text(
        //                 "",
        //                 // controller.profileData!.USR,
        //                 overflow: TextOverflow.ellipsis,
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: SizeApps.width(context, size: 0.025)),
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //       InkWell(
        //         onTap: () {
        //           // Get.offAllNamed(RouteConstant.login);
        //         },
        //         child: Icon(
        //           Icons.settings,
        //           color: Colors.white,
        //           size: SizeApps.width(context, size: 0.035),
        //         ),
        //       )
        //     ],
        //   ),
        // ),

        header(),
        // carousel(),

        categoriesTitle(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
        buildTips()
      ],
    );
  }
}
