import 'package:base/constans/dictionary.dart';
import 'package:base/constans/dimens.dart';
import 'package:base/utils/common_util.dart';
import 'package:flutter/material.dart';
import 'package:base/models/slider.dart';

class StateScreen extends StatefulWidget {
  final String title, desc, imagePath;
  bool confirmButton = false;
  VoidCallback onPress;

  StateScreen(
      {Key key,
      this.title,
      this.desc,
      this.imagePath,
      this.confirmButton,
      VoidCallback this.onPress})
      : super(key: key);

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.6,
            width: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.imagePath))),
          ),
          SizedBox(
            height: 60.0,
          ),
          Text(
            widget.title,
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
                widget.desc,
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
          widget.confirmButton
              ? Container(
                  margin: EdgeInsets.all(Dimens.padding32),
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: widget.onPress,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      Dictionary.BACK_TO_HOME,
                      style: buttonStyle,
                    ),
                    color: Colors.redAccent,
                    disabledTextColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
