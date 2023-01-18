part of '../../pages.dart';

class HomePage extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   AuthProvider authProvider = Provider.of<AuthProvider>(context);
  //   UserModel user = authProvider.user;
  //   return ListView(
  //     children: [
  //       HeaderHomePage(),
  //       Categories(),
  //       PopularProductsTitle(),
  //       PopularProducts(),
  //       NewArrivalsTitle(),
  //       NewArrivals(),
  //     ],
  //   );
  // }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      // return Container(
      //   margin: EdgeInsets.only(
      //     top: defaultMargin,
      //     left: defaultMargin,
      //     right: defaultMargin,
      //   ),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               'Hallo, ${user.name}',
      //               style: primaryTextStyle.copyWith(
      //                 fontSize: 24,
      //                 fontWeight: semiBold,
      //               ),
      //             ),
      //             Text(
      //               '@${user.username}',
      //               style: subtitleTextStyle.copyWith(
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         width: 54,
      //         height: 54,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           image: DecorationImage(
      //             image: NetworkImage(
      //               user.profilePhotoUrl,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // );
      return Container(
        padding: EdgeInsets.only(
            left: 20, right: 20, top: SizeApps.height(context, size: 0.025)),
        height: SizeApps.height(context, size: 0.26),
        width: SizeApps.width(context, size: 1),
        decoration: const BoxDecoration(
            color: AppColor.mainColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            )),
        child: Column(
          children: [
            Row(
              children: [
                CustomFormField(
                  title: 'Search',
                  isShowTitle: false,
                ),
                // InkWell(
                //   onTap: () {
                //     // Get.offAllNamed(RouteConstant.login);
                //   },
                //   child: Icon(
                //     Icons.settings,
                //     color: Colors.white,
                //     size: SizeApps.width(context, size: 0.035),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: SizeApps.width(context, size: 0.08),
                    //   width: SizeApps.width(context, size: 0.08),
                    //   // child: ClipRRect(
                    //   //     borderRadius: BorderRadius.circular(100.0),
                    //   //     child: CachedNetworkImage(
                    //   //         imageUrl: "Image",
                    //   //         fit: BoxFit.cover,
                    //   //         alignment: Alignment.center,
                    //   //         httpHeaders: {
                    //   //           // "authorization" : "Bearer ${controller.tokenAccess}",
                    //   //           // "x-authorization" : "${controller.token}",
                    //   //           // "Content-Type" : "image/*"
                    //   //         },
                    //   //         placeholder: (context, url) => Image.asset(
                    //   //               'assets/no_profile.png',
                    //   //               fit: BoxFit.cover,
                    //   //             ),
                    //   //         errorWidget: (context, url, error) {
                    //   //           return Image.asset(
                    //   //             'assets/no_profile.png',
                    //   //             fit: BoxFit.cover,
                    //   //           );
                    //   //         })),
                    // ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // controller.profileData == null ?
                        // ShimmerLine(width: SizeApps.width(context, size: 0.3)),
                        // Text(
                        //   'Hallo, ${user.name}',
                        //   // controller.profileData!.NAME,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: SizeApps.width(context, size: 0.035)),
                        // ),
                        Text(
                          'Hallo, ${user.name}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                            color: Colors.white,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 3,
                        // ),
                        // // controller.profileData == null ?
                        // ShimmerLine(width: SizeApps.width(context, size: 0.2)),
                        Text(
                          '@${user.username}',
                          // controller.profileData!.USR,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeApps.width(context, size: 0.035)),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        user.profilePhotoUrl,
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     // Get.offAllNamed(RouteConstant.login);
                //   },
                //   child: Icon(
                //     Icons.settings,
                //     color: Colors.white,
                //     size: SizeApps.width(context, size: 0.035),
                //   ),
                // )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  top: SizeApps.height(context, size: 0.15) - 130,
                  left: 7,
                  right: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.black12, width: 0.6))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bubble_chart,
                                    size: SizeApps.width(context, size: 0.03),
                                    color: Colors.black54,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Go Modern",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          SizeApps.width(context, size: 0.021),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "240",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        SizeApps.width(context, size: 0.04),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.wifi,
                                    size: SizeApps.width(context, size: 0.03),
                                    color: Colors.black54,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Go Digital",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          SizeApps.width(context, size: 0.021),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "8.240",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeApps.width(context, size: 0.04),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.black12, width: 0.6))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.online_prediction,
                                      size: SizeApps.width(context, size: 0.03),
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Go Online",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: SizeApps.width(context,
                                            size: 0.021),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "11.192",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          SizeApps.width(context, size: 0.04),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
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

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'All Shoes',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Running',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Training',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Basketball',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Hiking',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCard(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: productProvider.products
              .map(
                (product) => ProductTile(product),
              )
              .toList(),
          // children: [
          //   ProductTile(),
          //   ProductTile(),
          //   ProductTile(),
          //   ProductTile(),
          // ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        // Container(
        //   margin:
        //       EdgeInsets.only(top: SizeApps.height(context, size: 0.2) - 20),
        //   height: SizeApps.height(context, size: 0.8) + 20,
        //   decoration: BoxDecoration(
        //       color: AppColor.redBox,
        //       // greyishContainer2,
        //       borderRadius: BorderRadius.circular(15)),
        // ),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
