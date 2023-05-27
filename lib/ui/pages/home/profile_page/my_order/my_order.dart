part of '../../../pages.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Pesanan Saya',
            style: primaryTextStyle.copyWith(
              fontSize: 20,
            )),
      ),
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),

          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 15, right: 15),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                tabs: [
                  SizedBox(
                    child: Tab(text: "Diproses"),
                    width: 150,
                  ),
                  SizedBox(
                    child: Tab(text: "Selesai"),
                    width: 150,
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 520,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ProcessedWidget(),
                FinishWidget(),
                // Selesai(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
