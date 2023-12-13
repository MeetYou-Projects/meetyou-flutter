import 'package:flutter/cupertino.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:intl/intl.dart';
import 'package:meetyou/theme_manager/color_manager.dart';

class AppMethods {
  static String date(String stringDate) {
    //2022-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MMM yyyy').format(dateTime);
  }

  static String currency(String number) {
    return NumberFormat.currency(
      decimalDigits: 2,
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(double.parse(number));
  }

  static void dangerFlushbar(BuildContext context, String title) {
    Flushbar(
      backgroundColor: ColorManager.pink,
      title: 'Failed',
      titleColor: ColorManager.white,
      message: title,
      duration: Duration(seconds: 3),
      isDismissible: false,
    ).show(context);
  }
}
