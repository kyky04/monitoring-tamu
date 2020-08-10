import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:base/constans/dimens.dart';
import 'package:base/utils/route.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Im;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Activity {
  Uint8List uint8list;
  String message;

  Activity(this.uint8list, this.message);
}

class _HomePageState extends State<HomePage> {
  static String ip = 'http://192.168.1.17';
  String capture = ip + '/capture';
  String stream = ip + ':81/stream';
  final databaseReference = FirebaseDatabase.instance.reference();
  List<String> _tabs = ['One', 'Two', 'Three'];
  TabController controller;

  var _messageController = TextEditingController();
  List<Activity> listMessage = new List<Activity>();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  File _image;
  String _uploadedFileURL;
  ScreenshotController screenshotController = ScreenshotController();
  InAppWebViewController screenController;
  Uint8List _screenshotData;

  @override
  void initState() {
//    databaseReference.child('messages').once().then((DataSnapshot snapshot) {
//      print(snapshot.value);
//      Map<dynamic, dynamic> values=snapshot.value;
//      values.forEach((k,v) {
//        print('VALUE ${v['message']}');
//        listMessage.add(v['message']);
//      });
//    });
//    _screenshotData = base64Decode('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');
    databaseReference.child('activity').onChildAdded.listen((Event event) {
      Map<dynamic, dynamic> values = event.snapshot.value;
      print('VALUE ${values['title']}');

      String uri = values['path'];
      uri = uri.replaceAll("data:image/jpeg;base64,", "");
      uri = uri.replaceAll("%2F", "/");
      uri = uri.replaceAll("%2B", "+");
      print(uri);
//      _screenshotData = base64Decode(uri);

      final decodedBytes = base64Decode(uri);

//      var file = File("image.png");
//      file.writeAsBytesSync(decodedBytes);

      listMessage.add(new Activity(base64Decode(uri), values['title']));

      setState(() {});
    }, onError: (Object o) {
      final DatabaseError error = o;
      setState(() {
        print(error);
      });
    });
    firebaseCloudMessaging_Listeners();
    super.initState();
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.getToken().then((token) {
      print('TOKEN ' + token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
            heroTag: 'report',
            transitionBetweenRoutes: false,
            middle: const Text('Sistem Monitoring Tamu')),
        body: _buildView());
  }

  Widget _buildView() {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300,
                child: InAppWebView(
                  initialUrl: stream,
                  onWebViewCreated: (InAppWebViewController controller) {
                    screenController = controller;
                  },
                ),
              ),
              Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.red,
                      ),
                      onPressed: () => captureFoto(),
                    )),
              )
            ],
          ),
//          _screenshotData != null ? Image.memory(_screenshotData) : Container(),
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(tabs: [
              Tab(
                child: Text(
                  'Recent Activity',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Message',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(children: [
                Container(
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemCount: listMessage.length,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.memory(
                            listMessage[i].uint8list,
                            height: 70,
                            width: 70,
                          ),
                          title: Text(listMessage[i].message),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _messageController,
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText: 'Masukan Pesan',
                            border: OutlineInputBorder()),
                      ),
                      divide10,
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          onPressed: () => createRecord(),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  void createRecord() {
    databaseReference.set({
      'message': _messageController.text,
    });
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future captureFoto() async {
    Uint8List _imageData = await screenController.takeScreenshot();
    _screenshotData = _imageData;
    File file = File.fromRawPath(_screenshotData);

    uploadFile(testCompressFile(file));
    setState(() {

    });

    screenshotController.capture(pixelRatio: 1.5,
    ).then((File image) {
      //Capture Done
      setState(() {

      });
    }).catchError((onError) {
      print(onError);
    });
  }
  Future uploadFile(imageFile) async {
    print(imageFile);
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('activity/${imageFile}');
    StorageUploadTask uploadTask = storageReference.putFile(imageFile);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        print(_uploadedFileURL);

        databaseReference.push().set({
          'message': DateTime.now().toIso8601String(),
          'path': _uploadedFileURL,
        });
      });
    });
  }

  Future<Uint8List> testCompressFile(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );
    print(file.lengthSync());
    print(result.length);
    return result;
  }

  Future<Uint8List> testComporessList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 135,
    );
    print(list.length);
    print(result.length);
    return result;
  }
}
