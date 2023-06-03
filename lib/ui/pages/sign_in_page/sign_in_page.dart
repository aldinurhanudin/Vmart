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
        // (AppLocalizations.of(context)!.welcome.toTitleCase()),
        'Selamat Datang di Vegetable Mart !',
        'Kualitas Terbaik Dari Para Petani',
        'Kamu Senang Petani Menang',
        'Cuti',
        'Claim',
        'SPPD'
      ];

      List<String> subtitles = [
        // (AppLocalizations.of(context)!.labelLogin.toCapitalized()),
        '',
        'Sayur,buah dengan jaminan kualitas terbaik dan segar',
        'Ribuan petani lokal terbantu di setiap  belanjaan yang kamu beli',
        'Kamu bisa mengajukan cuti ',
        'Kamu bisa mengclaim apa yang menjadi hak mu',
        'Kamu bisa mengajukan pembuatan SPPD'
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
                    offset: const Offset(0, 3), // changes position of shadow
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
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome.png',
                      // height: 203,
                      // width: 268,
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
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome.png',
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
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome.png',
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
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome.png',

                      // height: 203,
                      // width: 268,
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
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome.png',
                      // height: 203,
                      // width: 268,
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
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/welcome.png',
                      // height: 203,
                      // width: 268,
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
                // AppLocalizations.of(context)!.welcome.toTitleCase(),

                titles[currentIndex],

                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 8),
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
            // Form username & Password

            SizedBox(
              height: 5,
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
                Container(
                  width: currentIndex == 4 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 4 ? blackColor : greyColor,
                  ),
                ),
                Container(
                  width: currentIndex == 5 ? 28 : 12,
                  height: 12,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 5 ? blackColor : greyColor,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
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
                      offset: const Offset(0, 2), // changes position of shadow
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
                      offset: const Offset(0, 2), // changes position of shadow
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

    Widget rememberMe() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
              height: 24.0,
              width: 24.0,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Color(0xFF7B7B7B)),
                child: Checkbox(
                    activeColor: primaryColor,
                    //  Color(0xff00C8E8),
                    value: _isChecked,
                    onChanged: _handleRemeberme),
              )),
          SizedBox(width: 10.0),
          Text(
            "Remember Me",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          )
        ]),
      );
    }

    Widget signInButton() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: handleSignIn,
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
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
          rememberMe(),
          isLoading ? LoadingButton() : signInButton(),
          Spacer(),
          footer(),
        ],
      ),
    );
  }

  void _handleRemeberme(value) async {
    // final loginController = Get.put(LoginController(authRepository: sl()));
    print("Handle Rember Me");
    _isChecked = value;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("remember_me", value);
    // SharedPreferences.getInstance().then(
    //   (prefs) {
    //     prefs.setBool("remember_me", value);
    //     prefs.setString("email", loginController.emailController.text);
    //     prefs.setString("password", loginController.passwordController.text);
    //   },
    // );
    setState(() {
      _isChecked = value;
    });
  }
  //  void _loadUserEmailPassword() async {
  //   print("Load Email");
  //   try {
  //     final loginController = Get.put(LoginController(authRepository: sl()));
  //     SharedPreferences _prefs = await SharedPreferences.getInstance();
  //     var _email = _prefs.getString("email") ?? "";
  //     var _password = _prefs.getString("password") ?? "";
  //     var _remeberMe = _prefs.getBool("remember_me") ?? false;

  //     print(_remeberMe);
  //     print(_email);
  //     print(_password);

  //     if (_remeberMe) {
  //       print("has ben remember");
  //       setState(() {
  //         _isChecked = true;
  //         loginController.emailController.text = _email;
  //         loginController.passwordController.text = _password;
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
