import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vmart/models/models.dart';
import 'package:vmart/providers/providers.dart';
import 'package:vmart/ui/pages/pages.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/order_complited_notifier.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/order_place_details.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/order_status.dart';
import 'package:vmart/ui/widgets/widgets.dart';

import '../../../../../shared/shared.dart';

class OrdersDetails extends StatefulWidget {
  final dynamic data;

  const OrdersDetails({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<OrdersDetails> createState() => _OrdersDetailsState();
}

int activeStep = 0;

class _OrdersDetailsState extends State<OrdersDetails> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    final orderCompletedNotifier = Provider.of<OrderCompletedNotifier>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Rincian Pesanan',
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
      );
    }

    Widget deliveryStatus() {
      return Container(
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
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.directions_car_outlined,
                      color: primaryColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Status Pengiriman',
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                EasyStepper(
                  activeStep: activeStep,
                  lineLength: 45,
                  stepShape: StepShape.circle,
                  stepBorderRadius: 15,
                  borderThickness: 2,
                  stepRadius: 28,
                  finishedStepBorderColor: Colors.orange,
                  finishedStepTextColor: Colors.orange,
                  finishedStepBackgroundColor: Colors.green,
                  activeStepIconColor: Colors.deepOrange,
                  showLoadingAnimation: true,
                  steps: [
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 0 ? 1 : 0.3,
                          child:
                              // Icon(Icons.check)
                              Image.asset('assets/Payment Success.png'),
                        ),
                      ),
                      customTitle: const Text(
                        'Di Proses',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 1 ? 1 : 0.3,
                          child:
                              // Icon(
                              //   Icons.car_crash,
                              // ),
                              Image.asset('assets/Eco Transportation.png'),
                        ),
                      ),
                      customTitle: const Text(
                        'Dalam proses Pengiriman',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 2 ? 1 : 0.3,
                          child:
                              // Image.asset('assets/3.png'),
                              Image.asset('assets/Delivery Success.png'),
                        ),
                      ),
                      customTitle: const Text(
                        'Terkirim',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 2 ? 1 : 0.3,
                          child: Image.asset('assets/Shopping Done.png'),
                        ),
                      ),
                      customTitle: const Text(
                        'Pesanan Selesai',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  // onStepReached: (index) =>
                  //     setState(() => activeStep = index),
                  onStepReached: (index) {
                    setState(() => activeStep = index);
                    if (index == 3) {
                      orderCompletedNotifier.markOrderCompleted();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyOrder()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget productDetail() {
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
              SizedBox(
                height: 10,
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
                    'Detail Produk',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Column(
                      children: cartProvider.carts
                          .map(
                            (cart) => MyOrderCardProcessed(cart),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        appBar: header(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('orders').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text('Loading...'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text("No orders yet",
                        style: TextStyle(color: Colors.grey));
                  } else {
                    var data =
                        snapshot.data!.docs[0].data() as Map<String, dynamic>;

                    return Column(
                      children: [
                        deliveryStatus(),
                        productDetail(),
                        Container(
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
                              right: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_shipping_outlined,
                                      color: primaryColor,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Info Pengiriman',
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   width: 93,
                                      // ),
                                      Text(
                                        "Kurir",
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${data['shipping_methode']}",
                                            style: secondaryTextStyle.copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "- ${data['order_code']}",
                                            style: secondaryTextStyle.copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
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
                              right: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons_googlemaps.png',
                                      width: 25,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Alamat Pengiriman',
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   width: 93,
                                      // ),

                                      Row(
                                        children: [
                                          Text(
                                            "${data['order_by_name']}",
                                            style: secondaryTextStyle.copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "- ${data['order_by_phone']}",
                                            style: secondaryTextStyle.copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${data['order_by_addres']}",
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
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
                                          color:
                                              isBlue ? Colors.blue : Colors.red,
                                        ),
                                      );
                                    })
                                        .expand((widget) =>
                                            [widget, SizedBox(width: 5)])
                                        .toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 400,
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
                                      'Rincian Pembayaran',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Metode Pembayaran',
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "${data['payment_method']}",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Kuantitas Produk',
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 12),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Harga Produk',
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                    Text(
                                      formatCurrency
                                          .format(cartProvider.totalPrice()),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Ongkos Kirim',
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "Rp.${data['shipping_cost']}",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Pembayaran',
                                      style: primaryTextStyle.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      formatCurrency.format(
                                          cartProvider.totalPriceShipping()),
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
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Rekomendasi untukmu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
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
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AllProductsPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 215,
                                      height: 278,
                                      margin: EdgeInsets.only(
                                        right: defaultMargin,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              'Lihat Semua',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
