import 'package:base/components/state_screen.dart';
import 'package:base/constans/dictionary.dart';
import 'package:base/environments/environment.dart';
import 'package:base/views/dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewUtil {
  static Widget buildErrorWidget(BuildContext context, String error,
      {VoidCallback onPressed}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//               Text(
//                 "Error occured: $error",
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.subtitle,
//               ),
              Image(image: AssetImage('assets/images/img_warning.png')),
              Text(
                "Oh no, something went worng!",
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
              Text(
                "Please check your connection again,or connect to wifi",
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .body2,
              ),
              SizedBox(
                height: 10,
              ),
              if (onPressed != null)
                MaterialButton(
                  color: Colors.red,
                  elevation: 0,
                  minWidth: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: onPressed,
                  child: const Text('Try again',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                )
            ],
          )),
    );
  }

  static Widget buildMessageWidget(BuildContext context,
      {VoidCallback onPressed, bool tapBelow = false}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/img_empty.png')),
              Text(
                "Nothing found here",
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
              if (tapBelow)
                Text(
                  "Tap + button to make your first",
                  textAlign: TextAlign.center,
                  style: Theme
                      .of(context)
                      .textTheme
                      .body2,
                ),
//               RaisedButton(
//                 onPressed: onPressed,
//                 child: const Text('Refresh', style: TextStyle(fontSize: 20)),
//               )
            ],
          )),
    );
  }

  static Widget buildLoadingWidget(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loading data from API...",
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ));
  }

  static String underTitle = 'Under Construction';
  static String underMessage = 'This page is under development';

  static Widget dialogPrompt(BuildContext context, String title, String content,
      {bool closeButton = false}) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              closeButton ? FlatButton(
                  onPressed: () {
                    _dismissDialog(context);
                  },
                  child: Text('Tidak')) : Container(),
              FlatButton(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: Text('Ya'),
              )
            ],
          );
        });
  }

  static Dialog dialogConfirm(BuildContext context,@required String title,@required String desc,String image,{VoidCallback onpress}) {
    showDialog(context: context, builder: (context) {
      return CustomDialog(title: title,description: desc,image: image,onpress: onpress);
    });
  }

  static Widget dialogMaintenance(BuildContext context) {
    showDialog(context: context, builder: (context) {
        return CustomDialog(title: Dictionary.UNDERCONSTRUCTION,description: Dictionary.UNDERCONSTRUCTION_DESC,image: '${Environment.imageAssets}under_construction.png',onpress: (){
          Navigator.pop(context);
        },);
    });
  }

  static Widget dialogUnderconstruction(BuildContext context) {
    dialogPrompt(context, underTitle, underMessage);
  }


  static _dismissDialog(BuildContext context) {
    Navigator.pop(context);
  }

}
