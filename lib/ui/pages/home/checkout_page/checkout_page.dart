part of '../../pages.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final String apiKey = 'd6e171a68e0353d3f840306a11756725';
  final String origin = '22';
  final String destination = '22';
  final int weight = 1000;

  List<dynamic> shippingCosts = [];
  bool isLoading = false;

  Future<void> fetchShippingCosts(String courier) async {
    setState(() {
      isLoading = true;
    });

    try {
      final String apiUrl = 'https://api.rajaongkir.com/starter/cost';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'key': apiKey,
          'content-type': 'application/x-www-form-urlencoded',
        },
        body: {
          'origin': origin,
          'destination': destination,
          'weight': weight.toString(),
          'courier': courier,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          shippingCosts = data['rajaongkir']['results'];
        });
      } else {
        throw Exception('Failed to fetch shipping cost');
      }
    } catch (error) {
      print(error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  String abbreviateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength - 3) + '...';
    }
  }

  bool isClicked = false;

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
    double hargaProduk = usePoints
        ? cartProvider.totalPrice().toDouble() - pointsToDeduct.toDouble()
        : cartProvider.totalPrice().toDouble();
    double totalHarga = usePoints
        ? cartProvider.totalPriceShipping().toDouble() -
            pointsToDeduct.toDouble()
        : cartProvider.totalPriceShipping().toDouble();
    header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Detail Pembayaran',
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
            Navigator.pop(context);
          },
        ),
      );
    }

    Widget address() {
      return Container(
        // width: 400,
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
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/addresslist');
                        },
                        child: Text(
                          "Ganti Alamat",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/icons_googlemaps.png',
                            width: 25,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aldi Nurhanudin 081546847733',
                              style: primaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              abbreviateText(
                                'Jln Simpang Tiga Lohbener No.9 Kec.Lohbener, Kab.Indramayu, Jawa Barat, ID 45252',
                                45,
                              ),
                              style: secondaryTextStyle.copyWith(
                                fontWeight: light,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    child: Row(
                      children: List.generate(10, (index) {
                        final isBlue = index % 2 == 0;
                        final flex = isBlue ? 1 : 1;

                        return Expanded(
                          flex: flex,
                          child: Container(
                            color: isBlue ? Colors.blue : Colors.red,
                          ),
                        );
                      })
                          .expand((widget) => [widget, SizedBox(width: 5)])
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget item() {
      return Container(
        // width: 400,
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
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 53,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        'Vmart',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Daftar item',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: cartProvider.carts
                    .map(
                      (cart) => CheckoutCard(cart),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    }

    Widget shippingOptions() {
      return Container(
        // width: 400,
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
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_shipping_outlined,
                    color: primaryColor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Opsi Pengiriman',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                  Navigator.pushNamed(context, '/selectdelivery');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // DropdownSearch<String>(
                    //   mode: Mode.MENU,
                    //   showSelectedItem: true,
                    //   items: ['jne', 'tiki', 'pos'],
                    //   label: 'Pilih Pengiriman',
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       isClicked = !isClicked;
                    //     });
                    //     fetchShippingCosts(newValue!);
                    //   },
                    // ),
                    //ini harus dibenarkan
                    DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: ["jne", "tiki", "pos"],
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Pilih Pengiriman",
                        hintText: "Pilih Pengiriman",
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          isClicked = !isClicked;
                        });
                        fetchShippingCosts(newValue!);
                      },
                      // selectedItem: selectedShipping,
                    ),

                    if (isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 4.0,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      )
                    else
                      AnimatedContainer(
                        duration: Duration(milliseconds: 1),
                        height: isClicked ? 90 : 15,
                        child: ListView.builder(
                          itemCount: shippingCosts.length,
                          itemBuilder: (ctx, index) {
                            final cost = shippingCosts[index];
                            final serviceName = cost['name'];
                            final serviceCost =
                                cost['costs'][0]['cost'][0]['value'];

                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.5),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: ListTile(
                                title: Text(serviceName),
                                subtitle: Text('Harga: Rp $serviceCost'),
                              ),
                            );
                          },
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

    Widget poin() {
      int pointsToDeduct = usePoints ? points : 0;
      return Container(
        height: 60,
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
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/koin.png',
                    width: 40,
                    height: 40,
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

                      final data =
                          snapshot.data!.data() as Map<String, dynamic>?;
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
      );
    }

    Widget paymentSummary() {
      int pointsToDeduct = usePoints ? points : 0;
      return Container(
        // width: 400,
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
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.assignment_outlined,
                    color: primaryColor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Ringkasan Belanja',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kuantitas Produk',
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    '${cartProvider.totalItems()} Barang',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga Produk',
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    formatCurrency.format(hargaProduk),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ongkos Kirim',
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    'Rp.8.000',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    formatCurrency.format(totalHarga),
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    }

    Widget checkoutButton() {
      int pointsToDeduct = usePoints ? points : 0;
      return Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: subtitleColor,
              width: 1,
            ),
          ),
        ),
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
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
                        width: 40,
                      ),
                      Container(
                        width: 120,
                        height: 45,
                        margin: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: TextButton(
                          onPressed: () async {
                            String url =
                                "https://app.sandbox.midtrans.com/payment-links/1689586706078";
                            if (await canLaunch(url)) {
                              await launch(url);
                              Navigator.pushNamedAndRemoveUntil(context,
                                  '/checkout-success', (route) => false);
                            } else {
                              throw 'Tidak dapat membuka URL: $url';
                            }
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bayar',
                                style: thirdTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: thirdTextColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            address(),
            SizedBox(
              height: 10,
            ),
            item(),
            SizedBox(
              height: 10,
            ),
            shippingOptions(),
            SizedBox(
              height: 10,
            ),
            poin(),
            SizedBox(
              height: 10,
            ),
            paymentSummary(),
          ],
        ),
      ),
      bottomNavigationBar: checkoutButton(),
    );
  }
}
