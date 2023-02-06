part of 'shared.dart';

double defaultMargin = 30.0;

const Color mainColor = Color(0xFF1F61AD);
Color primaryColor = Color(0xff00AA13);
Color secondaryColor = Color(0xff38ABBE);
Color alertColor = Color(0xffED6363);
Color priceColor = Color(0xff2C96F1);
Color backgroundColor1 = Color(0xffFAFAFC);
Color backgroundColor2 = Color(0xffFBFBFB);
Color backgroundColor3 = Color(0xffFAFAFC);
Color backgroundColor4 = Color(0xffF1F0F2);
Color backgroundColor5 = Color(0xff2B2844);
Color backgroundColor6 = Color(0xffECEDEF);
Color backgroundColor7 = Color(0xffFFFFFF);
Color primaryTextColor = Color(0xff22292E);
Color secondaryTextColor = Color(0xff999999);
Color thirdTextColor = Color(0xffFAFAFC);
Color subtitleColor = Color(0xff504F5E);
Color transparentColor = Colors.transparent;
Color blackColor = Color(0xff2E2E2E);
Color accentColor1 = Color(0xFFADADAD);
Color greyColor = Color(0xffA4A8AE);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);

TextStyle thirdTextStyle = GoogleFonts.poppins(
  color: thirdTextColor,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleColor,
);

TextStyle priceTextStyle = GoogleFonts.poppins(
  color: priceColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle alertTextStyle = GoogleFonts.poppins(
  color: alertColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

// Text Normal-Body
TextStyle whiteTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle blackTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle blueTextFont = GoogleFonts.poppins()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle redTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 12);
TextStyle greyTextFont = GoogleFonts.poppins()
    .copyWith(color: accentColor1, fontWeight: FontWeight.w500, fontSize: 12);

// Text Title
TextStyle whiteTextFontTitle = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15);
TextStyle blackTextFontTitle = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15);
TextStyle blueTextFontTitle = GoogleFonts.poppins()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500, fontSize: 15);
TextStyle redTextFontTitle = GoogleFonts.poppins()
    .copyWith(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 15);
TextStyle greyTextFontTitle = GoogleFonts.poppins()
    .copyWith(color: accentColor1, fontWeight: FontWeight.w500, fontSize: 15);

// Text Big
TextStyle whiteTextFontBig = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle blackTextFontBig = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle blueTextFontBig = GoogleFonts.poppins()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle redTextFontBig = GoogleFonts.poppins()
    .copyWith(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle greyTextFontBig = GoogleFonts.poppins()
    .copyWith(color: accentColor1, fontWeight: FontWeight.w500, fontSize: 18);

// BOLD

// Text Normal-Body
TextStyle whiteTextFontBold = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle blackTextFontBold = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle blueTextFontBold = GoogleFonts.poppins()
    .copyWith(color: mainColor, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle redTextFontBold = GoogleFonts.poppins()
    .copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12);
TextStyle greyTextFontBold = GoogleFonts.poppins()
    .copyWith(color: accentColor1, fontWeight: FontWeight.bold, fontSize: 12);

// Text Title
TextStyle whiteTextFontTitleBold = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
TextStyle blackTextFontTitleBold = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15);
TextStyle blueTextFontTitleBold = GoogleFonts.poppins()
    .copyWith(color: mainColor, fontWeight: FontWeight.bold, fontSize: 15);
TextStyle redTextFontTitleBold = GoogleFonts.poppins()
    .copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15);
TextStyle greyTextFontTitleBold = GoogleFonts.poppins()
    .copyWith(color: accentColor1, fontWeight: FontWeight.bold, fontSize: 15);

// Text Big
TextStyle whiteTextFontBigBold = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle blackTextFontBigBold = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle blueTextFontBigBold = GoogleFonts.poppins()
    .copyWith(color: mainColor, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle redTextFontBigBold = GoogleFonts.poppins()
    .copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18);
TextStyle greyTextFontBigBold = GoogleFonts.poppins()
    .copyWith(color: accentColor1, fontWeight: FontWeight.bold, fontSize: 18);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle blackNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.black);
