import 'package:base/blocs/sliders/slider_bloc.dart';
import 'package:base/components/custom_font.dart';
import 'package:base/components/skeleton.dart';
import 'package:base/models/sliders/slider_result.dart';
import 'package:base/utils/common_util.dart';
import 'package:base/utils/route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../environments/environment.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<SliderWidget> {
  @override
  void initState() {
    super.initState();
    bloc.getSlider();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(bloc.subject.stream);
  }

  Widget _buildView(Stream stream) {
    return StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return buildErrorWidget(snapshot.data.error);
            }
            return _buildWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.error);
          } else {
            return _buildLoading();
          }
        });
  }

  CarouselSlider _buildWidget(SliderResult items) {
    var width = MediaQuery.of(context).size.width;

    return CarouselSlider.builder(
        options: CarouselOptions(
          height: width / 2,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 7),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          enlargeCenterPage: true,
        ),
        itemCount: items.result.length,
        itemBuilder: (context, index) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: _buildItem(items.result[index]));
        });
  }

  _buildItem(SliderBanner item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteUtil.WEBVIEW, arguments: item.link);
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10.0,
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Image.network(
            Environment.endpoint + item.image,
            fit: BoxFit.cover,
            height: constraints.biggest.height,
            width: constraints.biggest.width,
          );
        }),
      ),
    );
  }

  Widget _buildLoading() {
    var width = MediaQuery.of(context).size.width;
    var itemHeight = width / 2;

    return Container(
      child: Skeleton(
        height: itemHeight,
        width: width,
      ),
    );
  }
}
