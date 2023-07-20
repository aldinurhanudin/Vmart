import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vmart/models/models.dart';
import 'package:vmart/providers/providers.dart';
import 'package:vmart/shared/shared.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/orders_details.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/review/review_order.dart';

class MyOrderCardFinish extends StatelessWidget {
  final CartModel cart;
  MyOrderCardFinish(
    this.cart,
  );

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrdersDetails()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
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
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        cart.product!.galleries![0].url,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.product!.name,
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${cart.quantity} Barang',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 12,
                // ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Belanja',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      'Rp.${cartProvider.totalPriceShipping()}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewOrder()),
                      );
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
                    child: Text(
                      'Ulas',
                      style: thirdTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 102,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Beli lagi',
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                        color: primaryColor,
                        fontWeight: semiBold,
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
}
