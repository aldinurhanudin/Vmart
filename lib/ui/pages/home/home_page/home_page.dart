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

    Widget search() {
      return Container(
        padding: const EdgeInsets.only(
          top: 16,
          right: 10,
          left: 20,
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
          color: Colors.white,
          // borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
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
            SizedBox(
              height: 23,
            ),
            Row(
              children: [
                Container(
                  width: 260,
                  height: 40,

                  // color: Colors.green,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextFormField(
                    // focusNode: controller.focusNodeSearch,
                    decoration: InputDecoration(
                      hintText: 'search',
                      hintStyle: blackTextStyle,
                      suffixIcon: Icon(Icons.search),
                    ),

                    // controller: controller.searchController,
                    textInputAction: TextInputAction.search,
                    // onFieldSubmitted: (value) =>
                    //     controller.onSearchPUMK(),
                  ),
                ),
                const SizedBox(
                  width: 19,
                ),
                Flexible(
                  flex: 2,
                  child: Card(
                    color: primaryColor,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100.0),
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');

                        // ChatPage();
                        // if (controller
                        //     .searchController.text.isNotEmpty) {
                        //   controller.onSearchPUMK();
                        // }
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          'assets/icon_chat.png',
                          width: 15,
                          color: Colors.white,
                        ),
                        // const Icon(
                        //   Icons.message_sharp,
                        //   size: 20,
                        //   color: Colors.white,
                        // )
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }

    Widget carousel() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 150,
              // width: 1000,
              child: CarouselSlider(
                items: [
                  Container(
                    width: 360,
                    height: 205,
                    decoration: BoxDecoration(
                      // color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/carousel_2.png',
                        fit: BoxFit.cover,
                        // height: 203,
                        // width: 400,
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 205,
                    decoration: BoxDecoration(
                      // color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/carousel_1.png',
                        fit: BoxFit.cover,
                        // height: 203,
                        // width: 268,
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 360,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/carousel_3.png',
                        fit: BoxFit.cover,
                        // height: 203,
                        // width: 268,
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 205,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/carousel_1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 205,
                    decoration: BoxDecoration(
                      // color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/carousel_2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 205,
                    decoration: BoxDecoration(
                      // color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/carousel_3.png',
                        fit: BoxFit.cover,
                      ),
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
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: currentIndex == 0 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 0 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 1 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 1 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 2 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 2 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 3 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 3 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 4 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 4 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 5 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 5 ? blackColor : greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget categoriesTitle() {
      return Container(
        // color: Colors.white,
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
        // color: Colors.white,
        height: 170,
        margin: EdgeInsets.only(
          top: defaultMargin,
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
            left: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilihan Kategori',
                style: primaryTextStyle.copyWith(
                  fontSize: 22,
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
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: defaultMargin,
                        ),
                        Text(
                          'Semua Kategori ',
                          style: primaryTextStyle.copyWith(
                            fontSize: 9,
                            fontWeight: semiBold,
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
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          width: defaultMargin,
                        ),
                        Text(
                          'Sayur Segar',
                          style: primaryTextStyle.copyWith(
                            fontSize: 9,
                            fontWeight: semiBold,
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
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          width: defaultMargin,
                        ),
                        Text(
                          'Buah Segar ',
                          style: primaryTextStyle.copyWith(
                            fontSize: 9,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
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
                            offset: const Offset(
                                0, 2), // changes position of shadow
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
                          color: Colors.white,
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
        height: 350,
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
          padding: const EdgeInsets.only(left: 30),
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
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
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
            left: 30,
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
              Column(
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
            ],
          ),
        ),
      );
    }

    Widget buildTips() {
      return Container(
        // margin: EdgeInsets.only(
        //   top: defaultMargin,
        //   left: defaultMargin,
        //   right: defaultMargin,
        // ),
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
          // borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kumpulan Tips Untukmu',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
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

        // header(),
        // SizedBox(
        //   height: 20,
        // ),
        search(),
        SizedBox(
          height: 20,
        ),
        carousel(),

        // categoriesTitle(),
        categories(),
        // popularProductsTitle(),
        popularProducts(),
        // newArrivalsTitle(),
        newArrivals(),
        SizedBox(
          height: 20,
        ),
        buildTips()
      ],
    );
  }
}
