part of '../../pages.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool usePoints = false;
  int points = 0;

  @override
  void initState() {
    super.initState();
    fetchPointsFromFirebase();
  }

  void fetchPointsFromFirebase() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('data')
          .doc('vmartPay')
          .get();

      final data = snapshot.data() as Map<String, dynamic>?;
      final fetchedPoints = data?['points'] ?? 0;
      setState(() {
        points = fetchedPoints;
      });
    } catch (e) {
      print('Error fetching points: $e');
    }
  }

  void _onSwitchChanged(bool value) {
    setState(() {
      usePoints = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    int pointsToDeduct = usePoints ? points : 0;
    double totalHarga = usePoints
        ? cartProvider.totalPrice().toDouble() - pointsToDeduct.toDouble()
        : cartProvider.totalPrice().toDouble();
    header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Keranjang',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: greyColor,
            height: 1.0,
            thickness: 1.2,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
          },
        ),
      );
    
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ups! Keranjang Anda kosong',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Ayo temukan produk favoritmu',
              style: secondaryTextStyle,
            ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Jelajahi Vmart',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: cartProvider.carts
            .map(
              (cart) => CartCard(cart),
            )
            .toList(),
      );
    }

    Widget customBottomNav() {
      int pointsToDeduct = usePoints ? points : 0;
      return Container(
        height: 130,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: subtitleColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/koin.png',
                            width: 32,
                            height: 32,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Tukarkan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('data')
                                .doc('vmartPay')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator();
                              }

                              final data = snapshot.data!.data()
                                  as Map<String, dynamic>?;
                              final points = data?['points'] ?? 'Loading...';
                              final formattedPoints = NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(points);
                              return Text(
                                ' $formattedPoints',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              );
                            },
                          ),
                          Text(
                            ' VmartPoin ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Icon(Icons.help_outline, size: 18),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Switch(
                            activeColor: primaryColor,
                            value: usePoints,
                            onChanged: _onSwitchChanged,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: subtitleColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Harga',
                                style: primaryTextStyle,
                              ),
                              Text(
                                formatCurrency.format(totalHarga),
                                style: priceTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            width: 180,
                            height: 50,
                            margin: EdgeInsets.symmetric(
                              horizontal: defaultMargin,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/checkout');
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Checkout',
                                    style: thirdTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: thirdTextColor,
                                  ),
                                ],
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
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: cartProvider.carts.length == 0 ? emptyCart() : content(),
      bottomNavigationBar:
          cartProvider.carts.length == 0 ? SizedBox() : customBottomNav(),
    );
  }
}
