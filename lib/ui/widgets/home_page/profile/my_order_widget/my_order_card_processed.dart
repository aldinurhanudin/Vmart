part of '../../../widgets.dart';

class MyOrderCardProcessed extends StatelessWidget {
  final CartModel cart;

  MyOrderCardProcessed(
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
              offset: const Offset(0, 2),
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
                      Row(
                        children: [
                          Text(
                            '${cart.quantity} Barang',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            ' (${cart.product!.isAvailable} g)',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
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
                Expanded(
                  child: Column(
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
                ),
                Container(
                  width: 120,
                  height: 39,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
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
                      'Beli Lagi',
                      style: thirdTextStyle.copyWith(
                        fontSize: 15,
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
