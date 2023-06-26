import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vmart/models/models.dart';
import 'package:vmart/providers/providers.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/order_place_details.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/order_status.dart';
import 'package:vmart/ui/widgets/widgets.dart';

import '../../../../../shared/shared.dart';

class OrdersDetails extends StatelessWidget {
  final dynamic data;

  const OrdersDetails({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
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
        ),
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
                            // borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              orderStatus(
                                color: Colors.red,
                                icon: Icons.done,
                                title: "Proses",
                                showDone: data != null &&
                                        data.containsKey('order_placed')
                                    ? data['order_placed']
                                    : false,
                              ),
                              orderStatus(
                                color: Colors.blue,
                                icon: Icons.thumb_up,
                                title: "Dikonfirmasi",
                                showDone: data != null &&
                                        data.containsKey('order_confirmed')
                                    ? data['order_confirmed']
                                    : false,
                              ),
                              orderStatus(
                                color: Colors.yellow,
                                icon: Icons.car_crash,
                                title: "Dalam Proses Pengiriman",
                                showDone: data != null &&
                                        data.containsKey('order_on_delivery')
                                    ? data['order_on_delivery']
                                    : false,
                              ),
                              orderStatus(
                                color: Colors.purple,
                                icon: Icons.done_all_rounded,
                                title: "Terkirim",
                                showDone: data != null &&
                                        data.containsKey('order_delivered')
                                    ? data['order_delivered']
                                    : false,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          // color: Colors.white,
                          height: 215,
                          // width: 900,

                          margin: EdgeInsets.only(
                            top: 14,
                          ),
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
                                  'Detail Produk',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: cartProvider.carts
                                            .map(
                                              (cart) => MyOrderCard(cart),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 270,
                          margin: EdgeInsets.only(
                            top: 14,
                          ),
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
                                  'Info Pengiriman',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Column(
                                  children: [
                                    // OrderPlaceDetails(
                                    //   d1: data['shipping_methode'] ?? "",
                                    //   d2: data['order_code'] ?? "",
                                    //   title1: "Kurir",
                                    //   title2: "No. Pesanan",
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "Kurir",
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 117),
                                            child: Expanded(
                                              child: Text(
                                                "${data['shipping_methode']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "No. Pesanan",
                                                  style: secondaryTextStyle
                                                      .copyWith(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.content_copy,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 56),
                                            child: Expanded(
                                              child: Text(
                                                "${data['order_code']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "Tanggal Pembelian",
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 75),
                                            child: Expanded(
                                              child: Text(
                                                (data['order_date'] != null)
                                                    ? DateFormat()
                                                        .add_yMd()
                                                        .format(
                                                            data['order_date']
                                                                .toDate())
                                                    : "",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 100),
                                          child: Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Alamat",
                                                  style: secondaryTextStyle
                                                      .copyWith(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.content_copy,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 140),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data['order_by_name']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "${data['order_by_phone']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "${data['order_by_email']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "${data['order_by_addres']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "${data['order_by_city']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "${data['order_by_state']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "${data['order_by_postalcode']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 250,
                          margin: EdgeInsets.only(
                            top: 14,
                          ),
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
                                  'Rincian Pembayaran',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              "Metode Pembayaran",
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: 80),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 100),
                                            child: Expanded(
                                              child: Text(
                                                "${data['payment_method']}",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PreferredSize(
                                      preferredSize: Size.fromHeight(1.0),
                                      child: Divider(
                                        color: greyColor,
                                        height: 1.0,
                                        thickness: 1.2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Total Harga",
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Rp.${cartProvider.totalPrice()}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "Total Ongkos Kirim",
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 69),
                                            child: Expanded(
                                              child: Text(
                                                'Rp.${data['shipping_cost']}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PreferredSize(
                                      preferredSize: Size.fromHeight(1.0),
                                      child: Divider(
                                        color: greyColor,
                                        height: 1.0,
                                        thickness: 1.2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Total Belanja",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Rp.${cartProvider.totalPriceShipping()}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
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
