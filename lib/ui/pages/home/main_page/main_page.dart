part of '../../pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 24,
        ),
      );
    }

    Widget customBottomNav() {
      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(17),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 12,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              unselectedLabelStyle:
                  const TextStyle(color: Colors.white, fontSize: 14),
              fixedColor: primaryColor,
              backgroundColor: backgroundColor7,
              currentIndex: pageProvider.currentIndex,
              onTap: (value) {
                pageProvider.currentIndex = value;
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 21,
                      color: pageProvider.currentIndex == 0
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_whislist.png',
                      width: 20,
                      color: pageProvider.currentIndex == 1
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 18,
                      bottom: 5,
                    ),
                    child: Image.asset(
                      'assets/education.png',
                      width: 25,
                      color: pageProvider.currentIndex == 2
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: 'Edukasi',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_profile.png',
                      width: 18,
                      color: pageProvider.currentIndex == 3
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: 'Akun',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return WishlistPage();
          break;
        case 2:
          return EducationPage();
          break;
        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
        backgroundColor: pageProvider.currentIndex == 0
            ? backgroundColor1
            : backgroundColor3,
        floatingActionButton: cartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        body: body());
  }
}
