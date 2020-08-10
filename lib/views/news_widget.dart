import 'package:base/blocs/news/news_bloc.dart';
import 'package:base/components/custom_font.dart';
import 'package:base/components/image_network.dart';
import 'package:base/constans/dictionary.dart';
import 'package:base/models/news/news_result.dart';
import 'package:base/utils/route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

import '../constans/dimens.dart';
import '../constans/dimens.dart';
import '../constans/dimens.dart';
import '../constans/dimens.dart';
import '../constans/dimens.dart';
import '../constans/dimens.dart';
import '../constans/dimens.dart';
import '../environments/environment.dart';

class NewsWidget extends StatefulWidget {
  var isHorizontal = false;

  @override
  _NewsWidgetState createState() => _NewsWidgetState();

  NewsWidget({Key key, this.isHorizontal}) : super(key: key);
}

class _NewsWidgetState extends State<NewsWidget> {
  var _isHorizontal = false;
  @override
  void initState() {

    super.initState();
    news_bloc.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(news_bloc.subject.stream);
  }

  Widget _buildView(Stream stream) {
    return StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _buildWidget(NewsResult news) {
    _isHorizontal = widget.isHorizontal;
    return ListView.builder(
      scrollDirection: _isHorizontal ? Axis.horizontal : Axis.vertical,
      itemCount: news.result.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(news.result[index]);
      },
    );
  }

  Widget _buildItem(News item) {
    var width = MediaQuery.of(context).size.width;
    var itemHeight = width / 4;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteUtil.NEWS_DETAIL, arguments: item);
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10.0,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Container(
          width: width / 1.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ImageNetwork(
                  Environment.endpoint+item.thumbnail,
                  itemHeight / 2,
                  width / 1.2,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomFont(
                  inputText: item.title,
                  fontSize: 12.0,
                  fontType: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                    CustomFont(
                      inputText: item.category.name,
                      fontSize: Dimens.sbHeight,
                      fontType: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                    VerticalDivider(width: Dimens.padding4,),
                    CircleAvatar(radius: 3.0,backgroundColor: Colors.amber,),
                    VerticalDivider(width: Dimens.padding4,),
                    CustomFont(
                      inputText: item.created_at,
                      fontSize: Dimens.sbHeight,
                      fontType: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CircularProgressIndicator()],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }
}
