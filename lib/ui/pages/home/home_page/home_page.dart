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
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
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
        // Container(
        //   padding: EdgeInsets.only(
        //       left: 20, right: 20, top: SizeApps.height(context, size: 0.055)),
        //   height: SizeApps.height(context, size: 0.2),
        //   width: SizeApps.width(context, size: 1),
        //   decoration: const BoxDecoration(color: AppColor.mainColor),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           SizedBox(
        //             height: SizeApps.width(context, size: 0.08),
        //             width: SizeApps.width(context, size: 0.08),
        //             child: ClipRRect(
        //                 borderRadius: BorderRadius.circular(100.0),
        //                 child: CachedNetworkImage(
        //                     imageUrl: "Image",
        //                     fit: BoxFit.cover,
        //                     alignment: Alignment.center,
        //                     httpHeaders: {
        //                       // "authorization" : "Bearer ${controller.tokenAccess}",
        //                       // "x-authorization" : "${controller.token}",
        //                       // "Content-Type" : "image/*"
        //                     },
        //                     placeholder: (context, url) => Image.asset(
        //                           'assets/no_profile.png',
        //                           fit: BoxFit.cover,
        //                         ),
        //                     errorWidget: (context, url, error) {
        //                       return Image.asset(
        //                         'assets/no_profile.png',
        //                         fit: BoxFit.cover,
        //                       );
        //                     })),
        //           ),
        //           const SizedBox(
        //             width: 8,
        //           ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               // controller.profileData == null ?
        //               ShimmerLine(width: SizeApps.width(context, size: 0.3)),
        //               Text(
        //                 "",
        //                 // controller.profileData!.NAME,
        //                 overflow: TextOverflow.ellipsis,
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: SizeApps.width(context, size: 0.035)),
        //               ),
        //               const SizedBox(
        //                 height: 3,
        //               ),
        //               // controller.profileData == null ?
        //               ShimmerLine(width: SizeApps.width(context, size: 0.2)),
        //               Text(
        //                 "",
        //                 // controller.profileData!.USR,
        //                 overflow: TextOverflow.ellipsis,
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: SizeApps.width(context, size: 0.025)),
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //       InkWell(
        //         onTap: () {
        //           // Get.offAllNamed(RouteConstant.login);
        //         },
        //         child: Icon(
        //           Icons.settings,
        //           color: Colors.white,
        //           size: SizeApps.width(context, size: 0.035),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
       
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
