import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String formatDateddMMyyyy(var date) {
  print("date formatted ${date.runtimeType}");
  var format = new DateFormat("dd/MM/yyyy");
  var formattedDate = format.format(DateTime.parse(date));
  return formattedDate;
}

showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey[400],
        textColor: Colors.white);
}
