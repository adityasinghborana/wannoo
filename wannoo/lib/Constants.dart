import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class themeColor {
  static const Color colorBgPrimary = Color(0xFFFDFDFD);
  static const Color colorBgSecondory = Color(0xFFf39505);
  static const Color colorscafold = Color(0xFFFBFDFF);

  static const Color colorTextPrimary = Color(0xff050A30);
  static const Color colorTextSecondry = Color(0xff9D9D9D);
  static const Color colorLink = Color(0xFFf39505);
  static const Color colorAccentPrimary = Color(0xFFf39505);
  static const Color colorAccentSecondory = Color(0xffFF0101);
  static const Color colorWhite = Color(0xffFFFFFF);
  static const Color colorBorder = Color(0xffD1D1D1);
  static const Color navbarColor = Color(0xff9D9D9D);
}

class globalPadding {
  static const double py_xxs = 10;
  static const double py_xs = 14;
  static const double py_sm = 22;
  static const double py_md = 22;
  static const double py_l = 22;
  static const double py_xl = 22;
  static const double py_xxl = 22;
  static const double px_xs = 6; //6,12,16,24,26,36
  static const double px_sm = 12;
  static const double px_md = 16;
  static const double px_l = 24;
  static const double px_xl = 26;
  static const double px_xxl = 36;
  static const double buttonSmallpy = 6;
  static const double buttonSmallpx = 14;
  static const double buttonMediumpy = 17;
  static const double buttonMediumpx = 104;
  static const double buttonLargepy = 17;
  static const double buttonLargepx = 144;
}

class globalRadius {
  static const double borderRadius_s = 10;
  static const double borderRadius_m = 15;
}

class globalFontsize {
  static const double font_xs = 8; //infigma
  static const double font_xs2 = 10; // in figma
  static const double font_s = 12; // in figma
  static const double font_md = 14; //in figma
  static const double font_l1 = 16; //in figma
  static const double font_l2 = 18; //in figma
  static const double font_xl = 20; //infigma
  static const double font_xxl = 24;
}

class image {
  static const String experiencesimages = 'asset/images/experiencesimg.png';
  static const String logo = 'asset/images/logo.png';
  static const String storyBoard1 = 'asset/images/Story1.png';
  static const String storyBoard2 = 'asset/images/story2.png';
  static const String storyBoard3 = 'asset/images/story3.png';
  static const String logoOrange = 'asset/images/logo_orange.png';
  static const String paymentsucess = 'asset/images/paymentsucess.png';
  static const String paymentfailure = 'asset/images/failure.png';
  static const String forgotPassword = 'asset/images/forgotpasswor.png';
  static const String enterOTP = 'asset/images/enterotp.png';
  static const String resetPassword = 'asset/images/resetpassword.png';
  static const String congo = 'asset/images/congo.png';
  static const String googleIcon = 'asset/images/Google.png';
  static const String facebookIcon = 'asset/images/facebook.png';
  static const String homeimage = 'asset/images/homeimage.png';
  static const String person = 'asset/images/person.jpeg';
  static const String Cat1 = 'asset/images/cat1.png';
  static const String Cat2 = 'asset/images/cat2.png';
  static const String Cat3 = 'asset/images/cat3.png';
  static const String Cat4 = 'asset/images/cat4.png';
}

class staticText {
  static const String story1Heading = 'Explore The World ';
  static const String story1Body =
      'Lorem ipsum dolor sit amet consectetur. Mi ultricies ultrices fermentum a. Duis neque lectus pharetra ac sed lorem.';
  static const String story2Heading = 'Make Great Memories ';
  static const String story2Body =
      'Lorem ipsum dolor sit amet consectetur. Mi ultricies ultrices fermentum a. Duis neque lectus pharetra ac sed lorem.';
  static const String story3Heading = 'Plan Your Dream Trip';
  static const String story3Body =
      'Lorem ipsum dolor sit amet consectetur. Mi ultricies ultrices fermentum a. Duis neque lectus pharetra ac sed lorem.';
  static const String loginEmail = 'Enter your Email';
  static const String loginGoogle = 'Login with Google';
  static const String loginFacebook = 'Login with Facebook';
  static const String signupGoogle = 'Signup with Google';
  static const String signupFacebook = 'Signup with Facebook';
  static const String loginPassword = 'Enter your Password';
  static const String signUpToLogin = 'Dont have an account? ';
  static const String loginToSignup = 'Already have an account? ';
  static const String signInLinkText = 'Log In';
  static const String signUpLinkText = 'Signup';
  static const String congoScreenText = "You're all set!";
  static const String congoScreenButtonText = "Let's Begin";
}

class CustomIcons {
  static const String help = 'asset/icons/customicon/help.svg';
  static const String bulb = 'asset/icons/customicon/bulb.svg';
  static const String dollar = 'asset/icons/customicon/dollar.svg';
  static const String edit = 'asset/icons/customicon/edit.svg';
  static const String legal = 'asset/icons/customicon/legal.svg';
  static const String track = 'asset/icons/customicon/track.svg';
  static const String history = 'asset/icons/customicon/history.svg';
  static const String editpic = 'asset/icons/customicon/editpic.svg';
}

class Height {
  static const double heightButtonLarge = 40;
  static const double heightButtonXLarge = 48;
  static const double heightSm = 10;
  static const double heightMd = 15;
  static const double heightl = 20;
  static const double heightxl = 30;
}

const String baseurl = "http://10.0.2.2:3000";

final BoxShadow globalShadow =
    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15);

class CustomTextStyles {
  // Font weight options
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;

  // Text styles for each font size with medium (w500) weight
  static final TextStyle fontXsMedium = GoogleFonts.inter(
    fontSize: globalFontsize.font_xs,
    fontWeight: fontWeightMedium,
  );

  static final TextStyle fontXs2Medium = GoogleFonts.inter(
    fontSize: globalFontsize.font_xs2,
    fontWeight: fontWeightMedium,
  );

  static final TextStyle fontSMedium = GoogleFonts.inter(
    fontSize: globalFontsize.font_s,
    fontWeight: fontWeightMedium,
  );

  static final TextStyle fontMdMedium = GoogleFonts.inter(
    fontSize: globalFontsize.font_md,
    fontWeight: fontWeightMedium,
  );

  static final TextStyle fontL1Medium = GoogleFonts.inter(
    fontSize: globalFontsize.font_l1,
    fontWeight: fontWeightMedium,
  );

  static final TextStyle fontL2Medium = GoogleFonts.inter(
    fontSize: globalFontsize.font_l2,
    fontWeight: fontWeightMedium,
  );

  static final TextStyle fontXlMedium = GoogleFonts.inter(
    fontSize: globalFontsize.font_xl,
    fontWeight: fontWeightMedium,
  );

  static final TextStyle fontXxlMedium = GoogleFonts.inter(
    fontSize: globalFontsize.font_xxl,
    fontWeight: fontWeightMedium,
  );

  // Text styles for each font size with semi-bold (w600) weight
  static final TextStyle fontXsSemiBold = GoogleFonts.inter(
    fontSize: globalFontsize.font_xs,
    fontWeight: fontWeightSemiBold,
  );

  static final TextStyle fontXs2SemiBold = GoogleFonts.inter(
    fontSize: globalFontsize.font_xs2,
    fontWeight: fontWeightSemiBold,
  );

  static final TextStyle fontSSemiBold = GoogleFonts.inter(
    fontSize: globalFontsize.font_s,
    fontWeight: fontWeightSemiBold,
  );

  static final TextStyle fontMdSemiBold = GoogleFonts.inter(
    fontSize: globalFontsize.font_md,
    fontWeight: fontWeightSemiBold,
  );

  static final TextStyle fontL1SemiBold = GoogleFonts.inter(
    fontSize: globalFontsize.font_l1,
    fontWeight: fontWeightSemiBold,
  );

  static final TextStyle fontL2SemiBold = GoogleFonts.inter(
    fontSize: globalFontsize.font_l2,
    fontWeight: fontWeightSemiBold,
  );

  static final TextStyle fontXlSemiBold = GoogleFonts.inter(
    fontSize: globalFontsize.font_xl,
    fontWeight: fontWeightSemiBold,
  );

  static final TextStyle fontXxlSemiBold = GoogleFonts.inter(
    fontSize: globalFontsize.font_xxl,
    fontWeight: fontWeightSemiBold,
  );
}
