part of '../../widgets.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.pushNamed(context, '/product');
  //     },
  //     child: Container(
  //       width: 215,
  //       height: 278,
  //       margin: EdgeInsets.only(
  //         right: defaultMargin,
  //       ),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         color: Color(0xffECEDEF),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SizedBox(
  //             height: 30,
  //           ),
  //           Image.network(
  //             product.galleries[0].url,
  //             // 'assets/image_shoes.png',
  //             width: 215,
  //             height: 150,
  //             fit: BoxFit.cover,
  //           ),
  //           Container(
  //             margin: EdgeInsets.symmetric(
  //               horizontal: 20,
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Hiking',
  //                   style: secondaryTextStyle.copyWith(
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 6,
  //                 ),
  //                 Text(
  //                   'COURT VISION 2.0',
  //                   style: blackTextStyle.copyWith(
  //                     fontSize: 18,
  //                     fontWeight: semiBold,
  //                   ),
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //                 SizedBox(
  //                   height: 6,
  //                 ),
  //                 Text(
  //                   '\$58,67',
  //                   style: priceTextStyle.copyWith(
  //                     fontSize: 14,
  //                     fontWeight: medium,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProductPage(product),
        //   ),
        // );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.network(
              product.galleries?[0].url,
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category?.name,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
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
}
