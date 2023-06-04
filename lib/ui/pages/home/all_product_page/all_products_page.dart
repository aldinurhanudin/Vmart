part of '../../pages.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 2,
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Container(
              width: 225,
              height: 60,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Buah&Sayur segar di sini...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(fontSize: 13.0),
              ),
            ),
            Flexible(
              flex: 2,
              child: Card(
                color: primaryColor,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/chat');
                      },
                      child: Image.asset(
                        'assets/icon_cart.png',
                        width: 23,
                        color: Colors.white,
                      ),
                    ),
                    // const Icon(
                    //   Icons.message_sharp,
                    //   size: 20,
                    //   color: Colors.white,
                    // )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: productProvider.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
        ),
        itemBuilder: (context, index) {
          final product = productProvider.products[index];
          return ProductAll(product);
        },
      ),
    );
  
  }
}
