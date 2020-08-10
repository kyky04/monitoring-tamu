import 'package:base/constans/dimens.dart';
import 'package:base/environments/environment.dart';
import 'package:base/models/profile/user_profile_result.dart';
import 'package:base/utils/common_util.dart';
import 'package:base/utils/route.dart';
import 'package:base/utils/scroll_behavior.dart';
import 'package:base/utils/view_util.dart';
import 'package:base/views/news_widget.dart';
import 'package:base/views/slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../environments/environment.dart';

class HomeScreen extends StatefulWidget {
  UserProfileResult user;

  HomeScreen(UserProfileResult this.user);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SafeArea(
        child: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  _buildHeader(),
                  SliderWidget(),
                  Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      children: <Widget>[
                        _builMenuButton(),
                        Container(
                          height: 10.0,
                        ),
                        _buildMenuGrid(),
                        Container(
                          height: 10.0,
                        ),
                        _buildHead('Berita Terkini'),
                        _buildListNews(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget _builMenuButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text(
                  'Buat Donasi',
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                color: Colors.deepPurple,
                textColor: Colors.white,
                onPressed: () {
                  ViewUtil.dialogMaintenance(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)))),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text(
                  'WhatsApp',
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  _launchWhatsApp(Environment.laporPhone);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)))),
          ),
        )
      ],
    );
  }

  _launchWhatsApp(String phoneNumber) async {
    print(phoneNumber);
    String message = 'hello from insani';
    var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  _buildMenuGrid() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _menuIcon(
                'Janji Dokter', Colors.blue, FontAwesomeIcons.calendarCheck,
                tap: () {
//              Navigator.pushNamed(context, RouteUtil.RESERVATION);
            }),
            _menuIcon(
                'Galang Dana', Colors.pink, FontAwesomeIcons.handHoldingMedical,
                tap: () {
              ViewUtil.dialogMaintenance(context);
            }),
            _menuIcon('Ambulance', Colors.green, FontAwesomeIcons.ambulance,
                tap: () {
//              Navigator.pushNamed(context, RouteUtil.AMBULANCE);
            }),
            _menuIcon('Homecare', Colors.orange, FontAwesomeIcons.clinicMedical,
                tap: () {
//              Navigator.pushNamed(context, RouteUtil.HOMECARE);
            }),
          ],
        ),
        Container(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _menuIcon(
                'Antrian', Colors.deepPurple, FontAwesomeIcons.notesMedical,
                tap: () {
              ViewUtil.dialogMaintenance(context);
            }),
            _menuIcon(
                'Kartu Pasien', Colors.amber, FontAwesomeIcons.addressCard,
                tap: () {
              ViewUtil.dialogMaintenance(context);
            }),
            _menuIcon('Berita', Colors.blueAccent, FontAwesomeIcons.newspaper,
                tap: () {
              Navigator.pushNamed(context, RouteUtil.NEWS);
            }),
            _menuIcon('More', Colors.deepOrangeAccent, FontAwesomeIcons.list,
                tap: () {
              ViewUtil.dialogMaintenance(context);
            }),
          ],
        ),
      ],
    );
  }

  Widget _menuIcon(title, bgColor, icon, {VoidCallback tap}) {
    return Expanded(
      child: InkWell(
        onTap: tap,
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: bgColor,
              child: IconButton(
                color: Colors.white,
                disabledColor: Colors.white,
                icon: Icon(
                  icon,
                  size: Dimens.avatarSize,
                ),
              ),
            ),
            Container(
              height: 4.0,
            ),
            Text(title,
                style: TextStyle(fontFamily: "Poppins", fontSize: 12.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildHead(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteUtil.NEWS);
            },
            child: Text('Lihat Semua',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12.0,
                    color: Colors.green,
                    decoration: TextDecoration.underline)),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.black12,
            backgroundImage: NetworkImage(
              Environment.endpoint + widget.user.profile.avatar,
            ),
            radius: Dimens.avatarRadiusSmall,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text('Hai, ${widget.user.name}',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16.0,
                )),
          ),
          IconButton(icon: Icon(Icons.notifications_none)),
        ],
      ),
    );
  }

  Widget _buildListNews() {
    var width = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: width / 1.75,
        child: NewsWidget(
          isHorizontal: true,
        ));
  }
}
