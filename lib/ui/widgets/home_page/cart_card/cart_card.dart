part of '../../widgets.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;

  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), 
          ),
        ],
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
                      cart.product!.galleries![0].url!,
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
                    ),
                    Text(
                      'Rp.${cart.product!.price}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (cart.quantity < cart.product!.totalStock) {
                        cartProvider.addQuantity(cart.id!);
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: backgroundColor3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Peringatan',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.error_outline,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              content: Text(
                                'Kamu sudah mencapai batas maksimum.',
                              ),
                              actions: [
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/button_add.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/button_min.png',
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  cartProvider.removeCart(cart.id!);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_remove.png',
                      width: 10,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Hapus',
                      style: alertTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Sisa ${cart.product!.totalStock!}',
                style: alertTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
