part of '../pages.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isChecked = false;
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');
  // @override
  // void initState() {
  //   _loadUserEmailPassword();
  //   super.initState();
  //   print(Get.arguments);
  // }

  bool isLoading = false;

  bool obscureText = true;
  // bool isLoading = false;

  // int currentIndex = 0;
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  bool isLanguage = true;
  bool isChecked1 = false;
  bool isChecked2 = false;

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Container(
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 20,
          //   vertical: 10,
          // ),
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 35,
                        height: 40,
                        child: Image.asset("assets/VMART_tanpa_nama.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Vegetable Mart',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                width: 34,
                height: 34,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.red,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        "ID",
                        style: whiteTextFont.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget slider() {
      List<String> titles = [
        'Selamat Datang di Vegetable Mart !',
        'Kualitas Terbaik Dari Petani',
        'Kamu Senang Petani Menang',
        'Produk Segar',
      ];

      List<String> subtitles = [
        '',
        'Sayur,buah dengan jaminan kualitas terbaik dan segar',
        'Ribuan petani lokal terbantu di setiap  belanjaan yang kamu beli',
        'Produk segar dari petani lokal, langsung ketempat anda',
      ];

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: CarouselSlider(
                items: [
                  Container(
                    width: 360,
                    height: 205,
                    margin: const EdgeInsets.only(
                      bottom: 1,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 12),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome.png',
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 205,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome4.png',
                      height: 203,
                      width: 268,
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 205,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome3.png',
                      height: 203,
                      width: 268,
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 205,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome1.png',
                    ),
                  ),
                ],
                options: CarouselOptions(
                    height: 204,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
                carouselController: carouselController,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                titles[currentIndex],
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  // AppLocalizations.of(context)!.labelLogin.toCapitalized(),
                  subtitles[currentIndex],

                  style: greyTextFont.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: currentIndex == 0 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 0 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 1 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 1 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 2 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 2 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 3 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 3 ? blackColor : greyColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Container(
          margin: EdgeInsets.only(top: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alamat Email',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
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
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon_email.png',
                        width: 17,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: primaryTextStyle,
                          controller: emailController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Alamat Email Anda',
                            hintStyle: subtitleTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget passwordInput() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kata Sandi',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
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
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon_password.png',
                        width: 17,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: primaryTextStyle,
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Kata Sandi Anda',
                            hintStyle: subtitleTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget captcha() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: 50,
            width: 180,
            // margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: backgroundColor1,
              // borderRadius: BorderRadius.circular(12),
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
              children: [
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Theme(
                      data: ThemeData(unselectedWidgetColor: Color(0xFF7B7B7B)),
                      child: Checkbox(
                        activeColor: primaryColor,
                        //  Color(0xff00C8E8),
                        value: _isChecked,
                        onChanged: _handleCaptcha,
                      ),
                    )),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "I'm not a robot",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  'assets/recaptcha.png',
                  width: 40,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/forgotPassword');
            },
            child: Text(
              "Lupa password?",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                fontWeight: bold,
              ),
            ),
          )
        ]),
      );
    }

    // Widget signInButton() {
    //   return Padding(
    //     padding: EdgeInsets.symmetric(horizontal: defaultMargin),
    //     child: Container(
    //       height: 50,
    //       width: double.infinity,
    //       margin: EdgeInsets.only(top: 30),
    //       child: TextButton(
    //         onPressed: handleSignIn,
    //         style: TextButton.styleFrom(
    //           backgroundColor: primaryColor,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //         ),
    //         child: Text(
    //           'Masuk',
    //           style: thirdTextStyle.copyWith(
    //             fontSize: 16,
    //             fontWeight: medium,
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    Widget signInButton() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: _isChecked ? handleSignIn : _showCaptchaAlert,
            style: TextButton.styleFrom(
              backgroundColor: _isChecked ? primaryColor : primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Masuk',
              style: thirdTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tidak Memiliki Akun?',
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                'Daftar',
                style: greenTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          header(),
          SizedBox(
            height: 10,
          ),
          slider(),
          emailInput(),
          passwordInput(),
          SizedBox(
            height: 5,
          ),
          captcha(),
          isLoading ? LoadingButton() : signInButton(),
          Spacer(),
          footer(),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom))
        ],
      ),
    );
  }

  void _handleCaptcha(value) async {
    _isChecked = value;

    setState(() {
      _isChecked = value;
    });
  }

  void _showCaptchaAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Klik Captcha Terlebih Dahulu!!',
            style: primaryTextStyle.copyWith(
              fontSize: 15,
              fontWeight: bold,
            ),
          ),
          content: Text('Harap klik Captcha sebelum masuk.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
