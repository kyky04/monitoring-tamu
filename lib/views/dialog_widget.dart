import 'package:base/constans/dictionary.dart';
import 'package:base/constans/dimens.dart';
import 'package:base/utils/common_util.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final String image;
  bool isPress = false;
  VoidCallback onpress = null;

  CustomDialog(
      {@required this.title,
      @required this.description,
      @required this.buttonText,
      this.image,
      this.isPress,
      this.onpress});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.padding16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: _buildView(context),
    );
  }

  Widget _buildView(BuildContext context) {
    return Container(
//      color: Colors.red,
//      height: double.infinity,
      padding: EdgeInsets.all(Dimens.padding32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.6,
            width: MediaQuery.of(context).size.height * 0.4,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          divide30,
          Text(
            title,
            style: TextStyle(
              fontFamily: Dictionary.POPPINS,
              fontWeight: FontWeight.w700,
              fontSize: 20.5,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: Dictionary.OPEN_SANS,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 12.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          divide30,
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: onpress,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                Dictionary.YES,
                style: buttonStyle,
              ),
              color: Colors.redAccent,
              disabledTextColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
            ),
          )
        ],
      ),
    );
  }
}
