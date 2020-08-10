import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildLoadingWidget() {
  return Container(
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CircularProgressIndicator()],
    )),
  );
}

Widget buildErrorWidget(String error) {
  return Container(
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    )),
  );
}

final buttonStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Poppins',
);

final kLabelStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
    fontSize: 20.0);

final kBoxDecorationStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Colors.black12, width: 0.5));

launchWhatsApp(String phoneNumber) async {
  String message = 'hello from insani';
  var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}