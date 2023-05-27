part of '../../pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permission denied forever, we cannot access',
      );
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String> getAddressFromLongLat(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
        return address;
      } else {
        return 'Alamat tidak ditemukan';
      }
    } catch (e) {
      return 'Terjadi kesalahan dalam mendapatkan alamat';
    }
  }

  String abbreviateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength - 3) + '...';
    }
  }

  @override
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
            // Container(
            //   width: 54,
            //   height: 54,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         user.profilePhotoUrl,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    }

    Widget carousel() {
      final TextEditingController _textController = TextEditingController();
      return Container(
        padding: const EdgeInsets.only(
          top: 16,
          right: 10,
          left: 20,
        ),
        height: 310,
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
            FutureBuilder<Position>(
              future: _getGeoLocationPosition(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Gagal mendapatkan posisi'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('Posisi tidak ditemukan'));
                }

                Position position = snapshot.data!;
                return FutureBuilder<String>(
                  future: getAddressFromLongLat(position),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Gagal mendapatkan alamat'));
                    } else if (!snapshot.hasData) {
                      return Center(child: Text('Alamat tidak ditemukan'));
                    }

                    String address = snapshot.data!;
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              const SizedBox(width: 5),
                              Text(
                                'Dikirim Ke',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                child: Text(
                                  abbreviateText(address, 25),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onLongPress: () {
                                  Clipboard.setData(
                                      ClipboardData(text: address));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            Row(
              children: [
                Container(
                  width: 280,
                  height: 60,
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Buah&Sayur segar di sini...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    style: TextStyle(fontSize: 13.0),
                  ),
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
                      // onTap: () {
                      //   // Navigator.pushNamed(context, '/cart');
                      //   // Navigator.pushNamed(context, '/chat');
                      //   // Navigator.pushNamedAndRemoveUntil(
                      //   //     context, '/chat', (route) => false);
                      //   ChatPage();
                      // },
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ChatPage(),
                            //   ),
                            // );
                            Navigator.pushNamed(context, '/chat');
                          },
                          child: Image.asset(
                            'assets/icon_chat.png',
                            width: 15,
                            color: Colors.white,
                          ),
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
            Padding(
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
                                offset: const Offset(
                                    0, 2), // changes position of shadow
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
                                offset: const Offset(
                                    0, 2), // changes position of shadow
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
                                offset: const Offset(
                                    0, 2), // changes position of shadow
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
                                offset: const Offset(
                                    0, 2), // changes position of shadow
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
                                offset: const Offset(
                                    0, 2), // changes position of shadow
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
                                offset: const Offset(
                                    0, 2), // changes position of shadow
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 95),
                child: Text(
                  'Kumpulan Tips Untukmu',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Wrap(
                spacing: 15,
                runSpacing: 15,
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
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
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
