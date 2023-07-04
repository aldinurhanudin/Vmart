part of '../../pages.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/image_kangkung.png',
    'assets/image_bayam.jpg',
    'assets/image_selada.png',
    'assets/image_apple.png',
    'assets/image_paprika.png',
    'assets/image_sawi.png',
    'assets/image_brokoli.png',
    'assets/image_sawi.png',
  ];

  int currentIndex = 0;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext contex) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item berhasil ditambahkan',
                    style: primaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 142,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Lihat Keranjang Saya',
                        style: thirdTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2), 
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
      );
    }

    Widget content() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 17,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2), 
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFFFFFFF),
          ),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: defaultMargin, left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: primaryTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            widget.product.category?.name,
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Sisa ${widget.product.stocks?.quantity}',
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              RatingStars(5),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        wishlistProvider.setProduct(widget.product);

                        if (wishlistProvider.isWishlist(widget.product)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: secondaryColor,
                              content: Text(
                                'Telah ditambahkan ke Daftar Keinginan',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: alertColor,
                              content: Text(
                                'Telah dihapus ke Daftar Keinginan',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        wishlistProvider.isWishlist(widget.product)
                            ? 'assets/button_wishlist_red.png'
                            : 'assets/button_wishlist.png',
                        width: 46,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: backgroundColor1,
                  borderRadius: BorderRadius.circular(13),
                  // color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2), 
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Harga',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Rp.${widget.product.price}',
                      style: priceTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),
            
              Container(
                height: isExpanded
                    ? 280
                    : 170, 
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: primaryTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 1),
                        firstChild: Text(
                          widget.product.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        secondChild: Text(
                          widget.product.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isExpanded ? 'SEMBUNYIKAN' : 'BACA SELENGKAPNYA',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            // SizedBox(width: 2.0),
                            Icon(
                              isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              size: 30.0,
                              color: primaryColor,
                            ),
                          ],
                        ),
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

    Widget tambahKeranjang() {
      return Container(
        // width: double.infinity,
        height: 70,
        child: Column(
          children: [
            Divider(
              thickness: 0.3,
              color: subtitleColor,
            ),
            Row(
              children: [
                SizedBox(
                  height: 8,
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailChatPage(widget.product),
                      ),
                    );
                  },
                  child: Container(
                    width: 54,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/button_chat.png',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 50,
                  width: 140,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addAddress');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: primaryColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Beli Sekarang',
                      style: greenTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 50,
                  width: 140,
                  child: TextButton(
                    onPressed: () {
                      cartProvider.addCart(widget.product);
                      showSuccessDialog();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      '+ Keranjang',
                      style: GoogleFonts.poppins(
                          color: backgroundColor1,
                          fontWeight: bold,
                          fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    header() {
      return AppBar(
        backgroundColor:
            Colors.transparent, 
        elevation: 0, 
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 40,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(
                      Icons.reply_rounded,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(
                      Icons.more_vert,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    pictureProduct() {
      int index = -1;
      return Column(
        children: [
          CarouselSlider(
            items: widget.product.galleries
                ?.map(
                  (image) => Image.network(
                    image.url!,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries!.map((e) {
              index++;

              return indicator(index);
            }).toList(),
          ),
        ],
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
              Text(
                'Produk Terbaru',
                style: primaryTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: productProvider.products
                    .take(6)
                    .map(
                      (product) => ProductTile(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          pictureProduct(),
          content(),
          newArrivals(),
        ],
      ),
      bottomNavigationBar: tambahKeranjang(),
    );
  }
}
