import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors{
  static Color get primary => Get.theme.primaryColor;
  static Color get scaffoldBackgroundColor=> Get.theme.scaffoldBackgroundColor;
  static const Color primaryBlackText = Color(0xff1B1923);
  static const Color backgroundlightred = Color(0xffFDE4E4);

  static set primary(Color color) {
    primary = color;
  }
  static MaterialColor materialColor = MaterialColor(
    0xFFF5C418,
    <int, Color>{
      50: Color(0xFFF5C418),
      100: Color(0xFFF5C418),
      200: Color(0xFFF5C418),
      300: Color(0xFFF5C418),
      400: Color(0xFFF5C418),
      500: Color(0xFFF5C418),
      600: Color(0xFFF5C418),
      700: Color(0xFFF5C418),
      800: Color(0xFFF5C418),
      900: Color(0xFFF5C418),
    },
  );
// Change names for Ocean APP

  static const defaultPrimaryColor = Color(0xFF1E8449);
  static const dattPrimaryColor = Color(0xFF1E8449);
  static const primaryColorDark = Color(0xff000080);
  static const backupPrimaryColor = Color(0xFF77A9F7);
  static const primaryLightColor = Color(0xff5fc7ff);
  static const borderShadow = Color(0xFFEEEEEE);
  static const transparentBg = Color(0x9C000000);
  static const borderLine = Color(0xFFAAAAAA);
  static const Color red = Color(0xffEB5355);
  static const Color disableColor = Color(0xff2F2B3D);
  static const Color textColorGrey = Color(0xff17151E);
  static const Color textColorMailHeading = Color(0xff343434);

  static const Color popupBg = Color(0xffB3B3B3);

  static const dividerColor = Color(0xffd8d8d8); //lightGrey;
  static const starFill = Color(0xffe6cb8d); //sand
  static const starBorder = Color(0xffd8d8d8); //lightGrey
  static const searchFieldIcons = Color(0xffd8d8d8); //lightGrey
  static final boxShadow = const Color(0xff9b9b9b).withOpacity(0.2); //warmGrey
  static const unselectedTabLabel = Color(0xffd8d8d8);
  static const unselectedBottomNavigation = Color(0xff9b9b9b);
  static const alertDialogBg = Color(0xff93C8E9);
  static const dividerColorBg = Color(0xffD0D4F1);

  static const lightTeal = Color(0xff8fcae7); // 2 icons background

  static const goldenYellow = Color(0xfffeca14);
  static const hyperlinkColor = Color(0xff007aff);
  static const Color rosa = Color(0xfffc8d9d);

  // Notification icons
  static const notificationProfile = Color(0xff007ac9); //cerulean
  static const notificationBookmark = Color(0xff00257a); //marineBlue
  static const notificationCoupon = Color(0xff3b5998); //denimBlue
  static const notificationProduct = Color(0xffd8d8d8); //lightGrey
  static const notificationWallet = Color(0xffe6cb8d); //sand

  // Help center icons
  static const helpEmailUs = Color(0xff007ac9); //cerulean
  static const helpFAQ = Color(0xff00257a); //marineBlue
  static const helpCallUs = Color(0xff8fcae7); //lightTeal

  // Coupons
  static const couponGradientStart = Color(0xffe6cb8d); //sand
  static const couponGradientEnd = Color(0xffdda11d);
  static const verifiedUserIcon = Color(0xff88d633);
  static const darkGrassGreen = Color(0xff398601);

  // Belly Badges
  static const bellyBadgeEmptyItemBackground = Color(0xff8fcae7); //lightTeal

  // sand gradient colors
  static const sandGradient1 = Color(0xffab8a5c);
  static const sandGradient2 = Color(0xffd4b474);
  static const sandGradient3 = Color(0xffd6b676);
  static const sandGradient4 = Color(0xffba9766);

  static const rewardsOverview = Color(0xfffde285);
  static const scannerPageIconBackground = Color(0xffc99f5a); // camel
  static const lightMutedYellow = Color(0xfffeec88);
  static const lightWashedYellow = Color(0xfffcd450);
  static const mummyLevelTierStepper = Color(0xffc99f5a);
  static const mummyLevelTabBodyColor = Color(0xfff6f6f6);
  static const location = Color(0xff484848);

  static const tabBarIndicatorColor = Colors.white;
  static const Color kImageBackgroundColor = Color(0xfff7f9fe);
  static final Color kImageBorderColor = Colors.grey.shade500;
  static const Color kHintTextColor = Color(0xff54585a);
  static const Color kMainTextColor = Color(0xff333333);
  static const Color kChatMeColor = Color(0xfff0f8ff);

  static const Color primaryBlueText = Color(0xff003e78);
  static const Color whiteBG = Color(0xffF8F7FA);
  static const Color darkGreyBG = Color(0xffE4E4E4);
  static const Color linen = Color(0xffFFEFE2);
  static const Color havelockBlue = Color(0xff5470C6);
  static const Color mediumSeaGreen = Color(0xff29C76F);
  static const Color mandy = Color(0xffEB5355);
  static const Color sunShade = Color(0xffFF9F42);
  static const Color purple = Color(0xff800080);
  static const Color magnolia = Color(0xffF8F7FA);
  static const Color luckyPoint = Color(0xff30324A);
  static const Color pattensBlue = Color(0xffD7E0EA);
  static const Color tutu = Color(0xffFDE4E4);
  static const Color cosmicLatte = Color(0xffE2F6E8);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color lightBlue = Color(0xff7092b3);
  static const Color lightGrey = Color(0xffbab9bb);
  static const Color royalBlue = Color(0xff1A73E8);
  static const Color secondaryBlackText = Color(0xff17151E);
  static const Color lightRedBackground = Color(0xffFDE4E4);
  static const Color lightOrangeBackground = Color(0xffFFEFE2);
  static const Color lighbluebackground = Color(0xfff0f1fb);
  static const Color dividerbackColor = Color(0xffc7c7d3);
  static const Color primaryGreenText = Color(0xff29C76F);
  static const Color backgroundlightgreen = Color(0xffE2F6E8);
  static const Color accentredcolor = Color(0xffEB5355);
  static const Color backgroundlightorange = Color(0xffFFEFE2);
  static const Color primaryOrangeColor = Color(0xffFF9F42);
  static const Color backgroundiconColor = Color(0xffF0F1FB);
  static const Color textprimaryColor = Color(0xff949399);
  static const Color bluebackground = Color(0xffD7E0EA);
  static const Color searchBoxBackground = Color(0xff082D50);
  }
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
