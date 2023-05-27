part of '../../pages.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final String apiKey =
      'd6e171a68e0353d3f840306a11756725'; // Ganti dengan API Key yang Anda dapatkan dari Raja Ongkir
  final String origin =
      '22'; //149indramayu// Ganti dengan kota asal pengiriman Anda
  final String destination = '22'; // Ganti dengan kota tujuan pengiriman Anda
  final int weight = 1000; // Ganti dengan berat pengiriman dalam gram

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

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Detail Pembayaran',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          // Note Address Details
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Alamat Pengiriman",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
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
                              fontSize: 14,
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
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  padding: EdgeInsets.all(20),
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
                    color: backgroundColor1,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 63),
                                child: Image.asset(
                                  'assets/icon_your_address.png',
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rumah',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                ),
                                Text(
                                  'Aldi Nurhanudin(081546847733)\nJln Simpang Tiga Lohbener No.9\nKec.Lohbener, Kab.Indramayu,\nJawa Barat, ID 45252',
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
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Note: List Items

          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar item',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          //pilih pengiriman

          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () {
                // SelectDelivery();
                Navigator.pushNamed(context, '/selectdelivery');
                // print('Container ditekan');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Icon(
                  //           Icons.local_shipping,
                  //           size: 30,
                  //           color: primaryColor,
                  //         ),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       width: 12,
                  //     ),
                  //     Expanded(
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Pilih Pengiriman',
                  //             style: primaryTextStyle.copyWith(
                  //               fontSize: 12,
                  //               fontWeight: medium,
                  //             ),
                  //           ),
                  //           Icon(
                  //             Icons.chevron_right,
                  //             size: 24,
                  //             color: Colors.grey,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItem: true,
                    items: ['jne', 'tiki', 'pos'],
                    label: 'Pilih Pengiriman',
                    onChanged: (String? newValue) {
                      fetchShippingCosts(newValue!);
                    },
                    // selectedItem: selectedShipping,
                  ),
                  if (isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    )
                  else
                    SizedBox(
                      height: 60, // Sesuaikan dengan tinggi yang diinginkan
                      child: ListView.builder(
                        itemCount: shippingCosts.length,
                        itemBuilder: (ctx, index) {
                          final cost = shippingCosts[index];
                          final serviceName = cost['name'];
                          final serviceCost =
                              cost['costs'][0]['cost'][0]['value'];

                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/checkout');
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(serviceName),
                                subtitle: Text('Harga: Rp $serviceCost'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),

          //Note: Payment Summary
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Belanja',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
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
                      'Rp.${cartProvider.totalPrice()}',
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
                      ' Ongkos Kirim',
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
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Rp.${cartProvider.totalPriceShipping()}',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Note:  Checkout Button
          SizedBox(
            height: defaultMargin,
          ),
        ],
      );
    }

    Widget checkoutButton() {
      return Container(
        height: 89,
        child: Column(
          children: [
            Divider(
              thickness: 0.3,
              color: subtitleColor,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: primaryTextStyle,
                    ),
                    Text(
                      'Rp.${cartProvider.totalPriceShipping()}',
                      style: priceTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
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
                          "https://app.sandbox.midtrans.com/payment-links/1684916383442";
                      if (await canLaunch(url)) {
                        await launch(url);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/checkout-success', (route) => false);
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
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: checkoutButton(),
    );
  }
}
