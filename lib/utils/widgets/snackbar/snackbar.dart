import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
}) {
  print("showing snackbar");
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: const Color(0xFF363636).withOpacity(0.9),
    textColor: Colors.white,
    fontSize: 18.0,
  );
}
