part of '../../pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Akun',
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
      );
    }

    Widget menuItem(String text, IconData icon) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: primaryTextColor,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      text,
                      style: primaryTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: primaryColor,
                  size: 20,
                ),
              ],
            ),
          ),
          Divider(
            color: greyColor,
            thickness: 0.5,
          ),
        ],
      );
    }

    Widget vmartPay() {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/wallet.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'VmartPay',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rp.0',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/koin.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vmartpoin',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '0 poin',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
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
            // borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5),
          // decoration: BoxDecoration(
          //   color: backgroundColor3,
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/addresslist');
                },
                child: menuItem(
                  'Daftar alamat saya',
                  Icons.location_on_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/myorder');
                },
                child: menuItem(
                  'Pesanan Saya',
                  Icons.receipt_long_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/education');
                },
                child: menuItem(
                  'Edukasi',
                  Icons.school,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: menuItem(
                  'Kuis',
                  Icons.lightbulb_outline_rounded,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/games');
                },
                child: menuItem(
                  'Vmart Games',
                  Icons.sports_esports_outlined,
                ),
              ),
              menuItem(
                'Kebijakan Privasi',
                Icons.lock_outline,
              ),
              menuItem(
                'Syarat dan Ketentuan',
                Icons.description_outlined,
              ),
              menuItem(
                'Bantuan',
                Icons.headset_mic_outlined,
              ),
              menuItem(
                'Pengaturan Akun',
                Icons.settings,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          HeaderAkunProfileWidget(),
          // vmartPay(),
          VmartPay(),
          SizedBox(
            height: 15,
          ),
          content(),
        ],
      ),
    );
  }
}
