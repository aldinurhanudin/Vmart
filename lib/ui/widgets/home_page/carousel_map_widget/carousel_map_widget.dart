part of '../../widgets.dart';

class CarouselMapWidget extends StatefulWidget {
  const CarouselMapWidget({super.key});

  @override
  State<CarouselMapWidget> createState() => _CarouselMapWidgetState();
}

class _CarouselMapWidgetState extends State<CarouselMapWidget> {
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

  final TextEditingController _textController = TextEditingController();
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  List<Widget> carouselItems = [
    Container(
      width: 360,
      height: 205,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
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
      height: 360,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/carousel_3.png',
          fit: BoxFit.cover,
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
            offset: const Offset(0, 2),
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
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
  ];

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(
          top: 16,
          right: 5,
          left: 5,
        ),
        height: 360,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2), 
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
                                  abbreviateText(address, 31),
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
                  width: 300,
                  height: 60,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
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
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/chat');
                          },
                          child: Image.asset(
                            'assets/icon_chat.png',
                            width: 15,
                            color: Colors.white,
                          ),
                        ),
                       
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
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  CarouselSlider(
                    items: carouselItems,
                    options: CarouselOptions(
                      height: 204,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 10),
                    ),
                    carouselController: carouselController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            carouselItems.length,
                            (index) => Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            ),
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
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
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
}